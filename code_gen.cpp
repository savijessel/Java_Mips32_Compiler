#include "code_gen.hpp"

SymbolTable *myTable;

int strLabelCount = 0;
int offsetCount = 4;
int paramCount = 0;
int ifStmtCount = 0;
int whileStmtCount = 0;
int shortCirCount = 0;
int notCount = 0;
std::string globRetLabel;

void preGlobPass(AST *node)
{
    switch (node->name)
    {

    case functiondeclarator:
        node->children[0]->symbolRef->label = "_" + node->children[0]->symbolRef->symbol;
        break;

    case variabledeclaration:
        if (node->children[1]->symbolRef->scope == 2 && node->children[1]->symbolRef->paramTypes.empty())
        {
            node->children[1]->symbolRef->label = "_" + node->children[1]->symbolRef->symbol; // possible bug point
            std::cout << data << node->children[1]->symbolRef->label << ":" << globalword;
        }

        else if (node->children[1]->symbolRef->scope > 2 && node->children[1]->symbolRef->paramTypes.empty())
        {
            node->children[1]->symbolRef->offset = offsetCount;
            offsetCount += 4;
        }
        break;

    case formalparameter:
        node->children[1]->symbolRef->offset = offsetCount;
        offsetCount += 4;
        break;

    case literal:
        if (node->nodeType == "string")
        {
            std::cout << data;
            std::string output;
            std::string label = "s" + std::to_string(strLabelCount);
            node->symbolRef->label = label;
            std::cout << label << ":" << bytearr;
            std::string attr = node->attribute + '\0';
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

            strLabelCount++;
        }
        break;

    default:
        break;
    }
}

void postGlobPass(AST *node)
{
    switch (node->name)
    {
    case mainfunctiondeclaration:
        node->offsetCount = offsetCount;
        offsetCount = 4;
        break;

    case functiondeclaration:
        if (node->children[0]->children[0]->name == type)
        {
            node->children[0]->children[1]->offsetCount = offsetCount;
        }
        else
        {
            node->children[0]->children[0]->offsetCount = offsetCount;
        }
        offsetCount = 4;
    default:
        break;
    }
}

void preSecondPass(AST *node)
{

    switch (node->name)
    {

    case breakstm:
        genSingleInst("j", node->label);
        break;
    case mainfunctiondeclaration:
        std::cout << maindec;
        genArithInst("addiu", "$sp", "$sp", std::to_string(-node->offsetCount));
        break;

    case functiondeclarator:

        node->children[0]->symbolRef->label = "_" + node->children[0]->symbolRef->symbol;
        globRetLabel = node->children[0]->symbolRef->label + "_end"; // *** IMPORTANT *** Possible bug point for multiple func decs
        std::cout << text;
        std::cout << node->children[0]->symbolRef->label << ":" << std::endl;
        genArithInst("addiu", "$sp", "$sp", std::to_string(-node->offsetCount));
        genPushStack("$ra", 0);
        break;

    case formalparameter:
        genPushStack("$a" + std::to_string(paramCount), node->children[1]->symbolRef->offset);
        paramCount++;
        break;

    case whilestm:
    {
        node->label = "while" + std::to_string(whileStmtCount);
        node->altLabel = "loop" + std::to_string(whileStmtCount);
        whileStmtCount++;

        std::string reg;
        std::cout << node->altLabel << ":" << std::endl;
        if (node->children[0]->name == identifier && node->children[0]->symbolRef->paramTypes.empty())
        {
            reg = reserveReg();
            genLoadID(node->children[0], reg);
        }
        else
        {

            prePostOrder(node->children[0], &preSecondPass, &postSecondPass);
            reg = node->children[0]->reg;
        }

        genArithInst("beq", reg, "$0", node->label);
        freeReg(reg);

        if (!node->children[1]->children.empty())
        {
            labelBreak(node);
            prePostOrder(node->children[1], &preSecondPass, &postSecondPass);
        }
        genSingleInst("j", node->altLabel);
        node->prune = true;
        std::cout << node->label << ":" << std::endl;
    }

    break;

    case ifstm:
    {

        node->label = "if" + std::to_string(ifStmtCount);
        node->altLabel = "elseIf" + std::to_string(ifStmtCount);
        ifStmtCount++;
        std::string reg;
        if (node->children[0]->name == identifier && node->children[0]->symbolRef->paramTypes.empty())
        {
            reg = reserveReg();
            genLoadID(node->children[0], reg);
        }
        else
        {
            prePostOrder(node->children[0], &preSecondPass, &postSecondPass);
            reg = node->children[0]->reg;
        }

        if (node->nodeType == "if else statement")
        {
            genArithInst("beq", reg, "$0", node->altLabel);
        }
        else
        {
            genArithInst("beq", reg, "$0", node->label);
        }
        freeReg(reg);

        if (!node->children[1]->children.empty())
        {
            prePostOrder(node->children[1], &preSecondPass, &postSecondPass);
            genSingleInst("j", node->label); // *** IMPORTANT LOOK INTO POSITIONING ONE LINE AFTER LATER ***
        }

        if (node->nodeType == "if else statement" && !node->children[1]->children.empty())
        {
            std::cout << node->altLabel << ":" << std::endl;
            prePostOrder(node->children[2], &preSecondPass, &postSecondPass);
        }

        node->prune = true;
        std::cout << node->label << ":" << std::endl;
    }

    break;

    default:
        break;
    }
}

void postSecondPass(AST *node)
{

    switch (node->name)
    {

    case mainfunctiondeclaration:
        genArithInst("addiu", "$sp", "$sp", std::to_string(node->offsetCount));
        genHalt();
        break;

    case functiondeclaration:
        int offset;
        if (node->children[0]->children[0]->name == type)
        {
            std::cout << node->children[0]->children[1]->children[0]->symbolRef->label << "_end:" << std::endl;
            offset = node->children[0]->children[1]->offsetCount;
        }
        else
        {
            std::cout << node->children[0]->children[0]->children[0]->symbolRef->label << "_end:" << std::endl;
            offset = node->children[0]->children[0]->offsetCount;
        }
        genPopStack("$ra", 0);
        genArithInst("addiu", "$sp", "$sp", std::to_string(offset));
        genSingleInst("jr", "$ra");
        paramCount = 0;
        break;

    case returnstm:
    {
        std::string reg;
        if (!node->children.empty() && node->children[0]->name == identifier)
        {
            reg = reserveReg();
            genLoadID(node->children[0], reg);
            genDoubleInst("move", "$v0", reg);
            freeReg(reg);
            genSingleInst("j", globRetLabel);
        }
        else if (!node->children.empty())
        {
            reg = node->children[0]->reg;
            genDoubleInst("move", "$v0", reg);
            freeReg(reg);
            genSingleInst("j", globRetLabel);
        }
    }
    break;

    case assignment:
    {
        std::string reg;
        if (node->children[1]->name == identifier)
        {
            reg = reserveReg();
            genLoadID(node->children[1], reg);
            genStoreID(node->children[0], reg);
            freeReg(reg);
        }
        else if (node->children[1]->name == assignment)
        {
            reg = reserveReg();
            genLoadID(node->children[1]->children[0], reg);
            genStoreID(node->children[0], reg);
            freeReg(reg);
        }
        else
        {
            reg = node->children[1]->reg;
            genStoreID(node->children[0], reg);
            freeReg(reg);
        }
    }
    break;

    case functioncall:
    {
        std::string jumpLabel;
        std::vector<std::string> regs;

        if (node->children[0]->attribute == "halt")
        {
            genHalt();
        }

        else if (node->children[0]->attribute == "prints")
        {
            genPrints(node);
        }

        else if (node->children[0]->attribute == "printi")
        {
            genPrinti(node);
        }

        else if (node->children[0]->attribute == "printc")
        {
            genPrintc(node);
        }

        else if (node->children[0]->attribute == "printb")
        {
            genPrintb(node);
        }

        else if (node->children[0]->attribute == "getchar")
        {
            genGetChar(node);
        }

        else
        {

            jumpLabel = node->children[0]->symbolRef->label;
            if (node->children[1] != nullptr && node->children[1]->name == argumentlist)
            {
                regs = getReserved();
                saveRegisters(regs);
                genArgs(node->children[1]);
                genSingleInst("jal", jumpLabel);
                std::string reg = reserveReg();
                genDoubleInst("move", reg, "$v0");
                node->reg = reg;
                loadRegisters(regs);
            }
            else
            {
                regs = getReserved();
                saveRegisters(regs);
                genSingleInst("jal", jumpLabel);
                std::string reg = reserveReg();
                genDoubleInst("move", reg, "$v0");
                node->reg = reg;
                loadRegisters(regs);
            }
        }
    }
    break;

    case unop:
    {
        std::string operand;

        if (node->children[0]->name == identifier && node->children[0]->symbolRef->paramTypes.empty())
        {
            operand = reserveReg();
            genLoadID(node->children[0], operand);
        }

        else
        {
            operand = node->children[0]->reg;
        }

        std::string opReg = reserveReg();

        if (node->attribute == "-")
        {
            genArithInst("subu", opReg, "$0", operand);
        }

        else if (node->attribute == "!")
        {
            std::string endLabel = "not_end_" + std::to_string(notCount);
            std::string oneLabel = "not_" + std::to_string(notCount);
            genArithInst("beq", operand, "$0", oneLabel);
            genDoubleInst("li", opReg, "0");
            genSingleInst("j", endLabel);
            std::cout << oneLabel << ":" << std::endl;
            genDoubleInst("li", opReg, "1");
            std::cout << endLabel << ":" << std::endl;
            notCount++;
        }

        node->reg = opReg;
        freeReg(operand);
    }
    break;

    case binop:
    {
        // genPushStack(node->children[0]->attribute);
        // genPushStack(node->children[1]->attribute);
        std::string left, right;

        if (node->children[0]->name == identifier && node->children[0]->symbolRef->paramTypes.empty())
        {
            left = reserveReg();
            genLoadID(node->children[0], left);
        }
        else
        {
            left = node->children[0]->reg;
        }
        if (node->children[1]->name == identifier && node->children[1]->symbolRef->paramTypes.empty())
        {
            right = reserveReg();
            genLoadID(node->children[1], right);
        }
        else
        {
            right = node->children[1]->reg;
        }
        std::string opReg = reserveReg(); //*****IMPORTANT*** remember to free opReg after it is used in func calls, assignments, etc.*****

        if (node->attribute == "+")
        {
            genArithInst("addu", opReg, left, right);
        }

        else if (node->attribute == "-")
        {
            genArithInst("subu", opReg, left, right);
        }

        else if (node->attribute == "*")
        {
            genArithInst("mul", opReg, left, right);
        }

        else if (node->attribute == "/")
        {
            genArithInst("div", opReg, left, right);
        }

        else if (node->attribute == "%")
        {
            genArithInst("rem", opReg, left, right);
        }

        else if (node->attribute == "==")
        {
            genArithInst("seq", opReg, left, right);
        }

        else if (node->attribute == "!=")
        {
            genArithInst("sne", opReg, left, right);
        }

        else if (node->attribute == ">")
        {
            genArithInst("sgt", opReg, left, right);
        }

        else if (node->attribute == "<")
        {
            genArithInst("slt", opReg, left, right);
        }

        else if (node->attribute == "<=")
        {
            genArithInst("sle", opReg, left, right);
        }

        else if (node->attribute == ">=")
        {
            genArithInst("sge", opReg, left, right);
        }

        else if (node->attribute == "&&")
        {
            std::string lfLabel = "and_left_false" + std::to_string(shortCirCount);
            std::string endLabel = "and_end" + std::to_string(shortCirCount);
            genArithInst("beq", left, "$0", lfLabel);
            genDoubleInst("move", opReg, right);
            genSingleInst("j", endLabel);
            std::cout << lfLabel << ":" << std::endl;
            genDoubleInst("li", opReg, "0");
            std::cout << endLabel << ":" << std::endl;
            shortCirCount++;
        }

        else if (node->attribute == "||")
        {
            std::string lfLabel = "or_left_true" + std::to_string(shortCirCount);
            std::string endLabel = "or_end" + std::to_string(shortCirCount);
            genArithInst("bne", left, "$0", lfLabel);
            genDoubleInst("move", opReg, right);
            genSingleInst("j", endLabel);
            std::cout << lfLabel << ":" << std::endl;
            genDoubleInst("li", opReg, "1");
            std::cout << endLabel << ":" << std::endl;
            shortCirCount++;
        }

        node->reg = opReg;
        freeReg(left);
        freeReg(right);

        break;
    }
    case literal:
    {
        if (node->nodeType == "string")
            break;
        if (node->nodeType == "boolean")
        {
            if (node->attribute == "true")
                node->attribute = "1";
            else
            {
                node->attribute = "0";
            }
        }

        std::string reg = reserveReg();
        genMemInst("li", reg, node->attribute);
        node->reg = reg;
    }
    break;

    default:
        break;
    }
}

int codeGeneration(AST *root, SymbolTable *symTable)
{
    myTable = symTable;
    /* std::cout << "reserved:" << reserveReg() << std::endl;
    std::cout << "reserved:" << reserveReg() << std::endl;
    std::cout << "reserved:" << reserveReg() << std::endl;
    saveRegisters(getReserved());
    loadRegisters(getReserved()); */

    prePostOrder(root, &preGlobPass, &postGlobPass);
    prePostOrder(root, &preSecondPass, &postSecondPass);

    return EXIT_SUCCESS;
}