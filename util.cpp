
#include "util.hpp"

// keep track of prints() calls
int genPrintsCount = 0;

// keep track of printb() calls
int genPrintbCount = 0;

int genStrCount = 0;

int genErrCount = 0;

std::map<std::string, int, std::greater<std::string>> regManager({

    {"$t0", 0},
    {"$t1", 0},
    {"$t2", 0},
    {"$t3", 0},
    {"$t4", 0},
    {"$t5", 0},
    {"$t6", 0},
    {"$t7", 0},
    {"$t8", 0},
    {"$t9", 0},
    {"$s0", 0},
    {"$s1", 0},
    {"$s2", 0},
    {"$s3", 0},
    {"$s4", 0},
    {"$s5", 0},
    {"$s6", 0},
    {"$s7", 0},

});

std::string reserveReg()
{
    std::string reg;
    for (auto &reg : regManager)
    {
        if (reg.second == 0)
        {
            reg.second = 1;
            return reg.first;
        }
    }

    exit(genError("Out of registers!"));
}

std::string reserveSReg()
{
    std::string reg;
    for (auto &reg : regManager)
    {
        if (reg.second == 0 && (reg.first)[1] == 's')
        {
            reg.second = 1;
            return reg.first;
        }
    }

    exit(genError("Out of registers!"));
}

void freeReg(std::string reg)
{
    auto regRef = regManager.find(reg);
    regRef->second = 0;
}

void printRegManager()
{
    for (auto &reg : regManager)
    {
        std::cout << "Reg: " << reg.first << " Status: " << reg.second << std::endl;
    }
}

std::vector<std::string> getReserved()
{

    std::vector<std::string> regs;
    for (auto &reg : regManager)
    {
        if (reg.second == 1)
        {
            regs.push_back(reg.first);
        }
    }

    return regs;
}

void saveRegisters(std::vector<std::string> regs)
{

    int offsetCount = 0;
    int offset = regs.size();

    genArithInst("addiu", "$sp", "$sp", std::to_string(-(offset * 4)));
    for (auto reg : regs)
    {
        genPushStack(reg, offsetCount);
        offsetCount += 4;
    }
}

void loadRegisters(std::vector<std::string> regs)
{

    int offsetCount = 0;

    for (auto reg : regs)
    {
        genPopStack(reg, offsetCount);
        offsetCount += 4;
    }

    std::string offset = std::to_string((regs.size() * 4));
    genArithInst("addiu", "$sp", "$sp", offset);
}
// Post order AST traversal with callback action

void postOrder(AST *node, std::function<void(AST *)> action)
{

    if (node == nullptr)
        return;
    for (auto child : node->children)
    {
        postOrder(child, action);
    }
    action(node);
}

// Pre order AST traversal with callback action
void preOrder(AST *node, std::function<void(AST *)> action)
{

    if (node == nullptr)
        return;

    action(node);

    for (auto child : node->children)
    {
        preOrder(child, action);
    }
}

// Pre and post order AST traversal with callback actions for both pre and post
void prePostOrder(AST *node, std::function<void(AST *)> preAction, std::function<void(AST *)> postAction)
{

    if (node == nullptr)
        return;

    preAction(node);

    if (node->prune)
    {
        node->prune = false;
        return;
    }

    for (auto child : node->children)
    {
        prePostOrder(child, preAction, postAction);
    }

    postAction(node);
}

void genArithInst(std::string op, std::string dest, std::string source1, std::string source2)
{
    std::cout << tab << op << tab << dest << "," << source1 << "," << source2 << std::endl;
}

void genArithInst(std::string op, std::string source1, std::string source2)
{
    std::cout << tab << op << tab << source1 << "," << source2 << std::endl;
}

void genSingleInst(std::string op, std::string dest)
{
    std::cout << tab << op << tab << dest << std::endl;
}

void genDoubleInst(std::string op, std::string dest, std::string source)
{
    std::cout << tab << op << tab << dest << "," << source << std::endl;
}
void genMemInst(std::string op, std::string dest, std::string source, std::string offset)
{
    std::cout << tab << op << tab << dest << "," << offset << "(" << source << ")" << std::endl;
}

void genMemInst(std::string op, std::string dest, std::string source)
{
    std::cout << tab << op << tab << dest << "," << source << std::endl;
}

void genMemInst(std::string op, std::string dest, int source)
{
    std::cout << tab << op << tab << dest << "," << source << std::endl;
}

void genPopStack(std::string value, int offset)
{
    genMemInst("lw", value, "$sp", std::to_string(offset));
    // genArithInst("addu", sp, sp, std::to_string(offset));
}

void genPushStackVal(std::string value, int offset)
{
    // genArithInst("subu", sp, sp, std::to_string(-offset));
    genMemInst("li", "$t0", value);
    genMemInst("sw", "$t0", "$sp", std::to_string(offset));
}

void genPushStack(std::string reg, int offset)
{
    // genArithInst("subu", sp, sp, std::to_string(-offset));
    genMemInst("sw", reg, "$sp", std::to_string(offset));
}

void genLoadID(AST *node, std::string reg)
{
    if (node->symbolRef->scope > 2)
    {
        genMemInst("lw", reg, "$sp", std::to_string(node->symbolRef->offset));
    }

    else if (node->symbolRef->scope == 2)
    {
        genMemInst("lw", reg, node->symbolRef->label);
    }
}

void genStoreID(AST *node, std::string reg)
{
    if (node->symbolRef->scope > 2)
    {
        genMemInst("sw", reg, "$sp", std::to_string(node->symbolRef->offset));
    }

    else if (node->symbolRef->scope == 2)
    {
        genMemInst("sw", reg, node->symbolRef->label);
    }
}

void genGlobalID(std::string value, std::string label)
{
    genMemInst("li", "$t0", value);
    genMemInst("sw", "$t0", "label");
}

void genHalt()
{
    genMemInst("li", "$v0", "10");
    std::cout << tab << "syscall" << std::endl;
}

void genArgs(AST *node)
{

    int argCount = 0;
    std::string reg;
    for (auto child : node->children)
    {

        if (child->name == identifier && child->symbolRef->paramTypes.empty())
        {
            reg = reserveReg();
            genLoadID(child, reg);
            genDoubleInst("move", "$a" + std::to_string(argCount), reg);
        }
        else if (child->name == assignment)
        {
            reg = reserveReg();
            genLoadID(child->children[0], reg);
            genDoubleInst("move", "$a" + std::to_string(argCount), reg);
        }

        else
        {
            reg = child->reg;
            genDoubleInst("move", "$a" + std::to_string(argCount), reg);
        }
        argCount++;
        freeReg(reg);
    }
}

void genPrints(AST *node)
{
    std::string strLabel = node->children[1]->children[0]->symbolRef->label;

    // allocate registers for print operation
    std::string reg = reserveReg();
    std::string countReg = reserveReg();
    std::string sizeReg = reserveReg();

    std::string beginLabel = "prints_begin_" + std::to_string(genPrintsCount);
    std::string endLabel = "prints_exit_" + std::to_string(genPrintsCount);

    // load string and initalize registers for use in loop
    genMemInst("la", reg, strLabel);
    genDoubleInst("li", countReg, "0");
    genMemInst("li", sizeReg, std::to_string(node->children[1]->children[0]->attribute.size() - 1));

    std::cout << beginLabel << ":" << std::endl;

    // load current byte and check if end of string has been reached
    genMemInst("lb", "$a0", reg, "0");
    genArithInst("beq", countReg, sizeReg, endLabel);

    // make print char sys call
    genDoubleInst("li", "$v0", "11");
    std::cout << tab << "syscall" << std::endl;

    genArithInst("addi", countReg, countReg, "1");
    genArithInst("addi", reg, reg, "1");
    genSingleInst("j", beginLabel);
    std::cout << endLabel << ":" << std::endl;

    // free all registers used in print op
    freeReg(reg);
    freeReg(countReg);
    freeReg(sizeReg);

    genPrintsCount++;
}

void genPrinti(AST *node)
{
    genArgs(node->children[1]);
    genDoubleInst("li", "$v0", "1");
    std::cout << tab << "syscall" << std::endl;
}

void genPrintc(AST *node)
{
    genArgs(node->children[1]);
    genDoubleInst("li", "$v0", "11");
    std::cout << tab << "syscall" << std::endl;
}

void genPrintb(AST *node)
{
    std::string endLabel = "print_b_end" + std::to_string(genPrintbCount);
    std::string elseLabel = "print_b_else" + std::to_string(genPrintbCount);
    std::string falseLabel = "s_print_b_false" + std::to_string(genPrintbCount);
    std::string trueLabel = "s_print_b_true" + std::to_string(genPrintbCount);

    genArgs(node->children[1]);
    genArithInst("bne", "$a0", "$0", elseLabel);

    std::cout << data;
    std::cout << falseLabel << ":" << falsestr;
    std::cout << text;
    genDoubleInst("la", "$a0", falseLabel);

    genSingleInst("j", endLabel);

    std::cout << elseLabel << ":" << std::endl;
    std::cout << data;
    std::cout << trueLabel << ":" << truestr;
    std::cout << text;
    genDoubleInst("la", "$a0", trueLabel);

    std::cout << endLabel << ":" << std::endl;

    genDoubleInst("li", "$v0", "4");
    std::cout << tab << "syscall" << std::endl;

    genPrintbCount++;
}

void genGetChar(AST *node)
{

    genDoubleInst("li", "$v0", "12");
    std::cout << tab << "syscall" << std::endl;
    node->reg = "$v0";
}

void labelBreak(AST *node)
{
    for (auto n : node->children[1]->children[0]->children)
    {
        if (n->name == breakstm)
        {
            n->label = node->label;
        }
    }
}

void genRetError(std::string message)
{
    std::cout << data;
    std::cout << "err" << genErrCount << ":" << std::endl;
    std::cout << ".asciiz\t"
              << message << std::endl;
    std::cout << text;
    genDoubleInst("la", "$a0", "err" + std::to_string(genErrCount));
    genDoubleInst("li", "$v0", "4");
    std::cout << tab << "syscall" << std::endl;
    genHalt();
    genErrCount++;
}
void genByteArr(std::string str)
{
    std::cout << data;
    std::string label = "cS" + std::to_string(genStrCount);
    std::cout << label << ":" << bytearr;
    std::string output;
    std::string attr = str + '\0';

    for (int i = 0; i < attr.length(); i++)
    {

        if (attr[i] == '\\' && attr[i + 1] != '\0')
        {
            switch (attr[i + 1])
            {
            case 'n':
                output += std::to_string(int('\n')) + " , ";
                i++;
                break;

            case 'b':
                output += std::to_string(int('\b')) + " , ";
                i++;
                break;

            case 't':
                output += std::to_string(int('\t')) + " , ";
                i++;
                break;

            case 'f':
                output += std::to_string(int('\f')) + " , ";
                i++;
                break;

            case '\'':
                output += std::to_string(int('\'')) + " , ";
                i++;
                break;

            case '\"':
                output += std::to_string(int('\"')) + " , ";
                i++;
                break;

            case 'r':
                output += std::to_string(int('\r')) + " , ";
                i++;
                break;

            default:
                break;
            }
        }
        else
        {
            output += std::to_string(int(attr[i])) + " , ";
        }
    }
    output.pop_back();
    output.pop_back();
    std::cout << output << std::endl;
    std::cout << align << std::endl;
    genStrCount++;
}
int genError(std::string message)
{
    std::cerr << "Error: " << message << std::endl;
    return EXIT_FAILURE;
}
// Helper function to output print elements
std::ostream &operator<<(std::ostream &out, const printHelper value)
{

    switch (value)
    {

    case tab:
        return out << "\t";

    case newline:
        return out << "\n";

    case data:
        return out << ".data" << std::endl;

    case text:
        return out << ".text" << std::endl;

    case globalword:
        return out << ".word 0" << std::endl;

    case maindec:
        return out << text << std::setw(8) << tab << ".globl main" << newline << "main:" << std::endl;

    case bytearr:
        return out << tab << ".byte ";

    case align:
        return out << tab << ".align 2 ";

    case falsestr:
        return out << tab << ".asciiz \"false\" " << std::endl;

    case truestr:
        return out << tab << ".asciiz \"true\" " << std::endl;

    case sp:
        return out
               << "$sp";

    case t0:
        return out << "$t0";

    case t1:
        return out << "$t1";

    case t2:
        return out << "$t1";

    case t3:
        return out << "$t1";

    case t4:
        return out << "$t1";

    case t5:
        return out << "$t1";

    case t6:
        return out << "$t1";

    case t7:
        return out << "$t1";

    case zeroreg:
        return out << "$0";

    default:
        return out << "";
    };
}