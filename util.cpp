
#include "util.hpp"

// keep track of prints() calls
int genPrintsCount = 0;

// keep track of printb() calls
int genPrintbCount = 0;

// keeps track of genStr() calls
int genStrCount = 0;

// keeps track of genErr() calls
int genErrCount = 0;

// keeps track of genErr() calls
int genCharCount = 0;

// map to manage register allocation
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

// reserve a register from the pool and mark it as busy
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

// reserve an 's' register from the pool and mark is as busy
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

// free an allocated register
void freeReg(std::string reg)
{
    auto regRef = regManager.find(reg);
    regRef->second = 0;
}

// print contents of reg pool
void printRegManager()
{
    for (auto &reg : regManager)
    {
        std::cout << "Reg: " << reg.first << " Status: " << reg.second << std::endl;
    }
}

// get all allocated registers
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

// save a list of registers to the stack
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

// load a list of registers from the stack
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

// Variations of function to generate arithmetic instructions OR
// instructions with similar structure as arithmetic instructions
void genArithInst(std::string op, std::string dest, std::string source1, std::string source2)
{
    std::cout << tab << op << tab << dest << "," << source1 << "," << source2 << std::endl;
}

void genArithInst(std::string op, std::string source1, std::string source2)
{
    std::cout << tab << op << tab << source1 << "," << source2 << std::endl;
}

// Generates instructions with a single register
void genSingleInst(std::string op, std::string dest)
{
    std::cout << tab << op << tab << dest << std::endl;
}

// Generate instructiosn with only two registers
void genDoubleInst(std::string op, std::string dest, std::string source)
{
    std::cout << tab << op << tab << dest << "," << source << std::endl;
}

// Variations of a function to generate functions used for memory access OR
// local immediate loads and stores
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

// Generates instructions to pop the stack
void genPopStack(std::string value, int offset)
{
    genMemInst("lw", value, "$sp", std::to_string(offset));
}

// Variations of functions to push a value or reg to the stack
void genPushStackVal(std::string value, int offset)
{

    genMemInst("li", "$t0", value);
    genMemInst("sw", "$t0", "$sp", std::to_string(offset));
}

void genPushStack(std::string reg, int offset)
{

    genMemInst("sw", reg, "$sp", std::to_string(offset));
}

// Generates instructions to load global/local IDs
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

// Generates instructions to store global/local IDs
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

// Generates instructions to store imm to global ID
void genGlobalID(std::string value, std::string label)
{
    genMemInst("li", "$t0", value);
    genMemInst("sw", "$t0", "label");
}

// Generates halt() runtime library function
void genHalt()
{
    genMemInst("li", "$v0", "10");
    std::cout << tab << "syscall" << std::endl;
}

// Generates instructions to process arguments for function calls
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

// Generates prints() runtime library function
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
    genMemInst("li", sizeReg, std::to_string(node->children[1]->children[0]->strLen));

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

// Generates printi() runtime library function
void genPrinti(AST *node)
{
    genArgs(node->children[1]);
    genDoubleInst("li", "$v0", "1");
    std::cout << tab << "syscall" << std::endl;
}

// Generates printc() runtime library function
void genPrintc(AST *node)
{
    genArgs(node->children[1]);
    genDoubleInst("li", "$v0", "11");
    std::cout << tab << "syscall" << std::endl;
}

// Generates printb() runtime library function
void genPrintb(AST *node)
{
    // declare and assign labels
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

// Generates getchar() runtime library function
void genGetChar(AST *node)
{

    std::cout << data;
    std::string charLabel = "char_" + std::to_string(genCharCount);
    std::string finLabel = charLabel + "_fin";
    std::string endLabel = charLabel + "_end";
    std::cout << charLabel << ": .space 2" << std::endl;
    std::cout << text;

    genDoubleInst("li", "$v0", "8");
    genDoubleInst("la", "$a0", charLabel);
    genDoubleInst("li", "$a1", "2");
    std::cout << tab << "syscall" << std::endl;
    std::string reg = reserveReg();
    std::string reg1 = reserveReg();
    genDoubleInst("la", reg, charLabel);
    genMemInst("lb", reg1, reg, "0");
    genArithInst("bne", reg1, "\'-\'", endLabel);

    genDoubleInst("li", "$v0", "8");
    genDoubleInst("la", "$a0", charLabel);
    genDoubleInst("li", "$a1", "2");
    std::cout << tab << "syscall" << std::endl;
    genDoubleInst("la", reg, charLabel);
    genMemInst("lb", reg1, reg, "0");
    genArithInst("bne", reg1, "\'1\'", endLabel);
    genDoubleInst("li", "$v0", "-1");
    genSingleInst("j", finLabel);
    std::cout << endLabel << ":" << std::endl;
    genMemInst("lb", reg, reg, "0");
    genDoubleInst("move", "$v0", reg);
    std::cout << finLabel << ":" << std::endl;
    node->reg = "$v0";
    genCharCount++;
    freeReg(reg);
    freeReg(reg1);
}

// Generates instruction to execute a runtime error
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

// Utility function used to generate error message
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
    default:
        return out << "";
    };
}