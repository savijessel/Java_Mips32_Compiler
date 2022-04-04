#include "code_gen.hpp"

// symbol table entry reference
SymbolTable *myTable;

// counters to help manage labels
int strLabelCount = 0;
int offsetCount = 4;
int paramCount = 0;
int ifStmtCount = 0;
int whileStmtCount = 0;
int shortCirCount = 0;
int notCount = 0;

// globals to keep track of return and break labels
std::string globRetLabel;
std::string globBreakLabel;

// pre order actions for pass that performs preprocessing for function declarations, variable declarations, parameters, and literals
void preGlobPass(AST *node)
{
    switch (node->name)
    {

    // store labels for func decls
    case functiondeclarator:
        node->children[0]->symbolRef->label = "_" + node->children[0]->symbolRef->symbol;
        break;

    // store labels and offsets for variable decs
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

    // store offset for formal parameters
    case formalparameter:
        node->children[1]->symbolRef->offset = offsetCount;
        offsetCount += 4;
        break;

    // handle string literals
    case literal:
        if (node->nodeType == "string")
        {
            std::cout << data;
            std::string output;
            std::string label = "s" + std::to_string(strLabelCount);
            node->symbolRef->label = label;

            // output label and byte array
            std::cout << label << ":" << bytearr;
            std::string attr = node->attribute;
            node->strLen = attr.length();

            // loop through given string and handle escapes
            for (int i = 0; i < attr.length(); i++)
            {
                // check if \ escape is detected
                // decrement string length used for codegen accordingly
                if (attr[i] == '\\' && (i + 1) < attr.length())
                {
                    switch (attr[i + 1])
                    {
                    case 'n':
                        output += std::to_string(int('\n')) + " , ";
                        node->strLen--;
                        i++;
                        break;

                    case 'b':
                        output += std::to_string(int('\b')) + " , ";
                        node->strLen--;
                        i++;
                        break;

                    case 't':
                        output += std::to_string(int('\t')) + " , ";
                        node->strLen--;
                        i++;
                        break;

                    case 'f':
                        output += std::to_string(int('\f')) + " , ";
                        node->strLen--;
                        i++;
                        break;

                    case '\'':
                        output += std::to_string(int('\'')) + " , ";
                        node->strLen--;
                        i++;
                        break;

                    case '\"':
                        output += std::to_string(int('\"')) + " , ";
                        node->strLen--;
                        i++;
                        break;

                    case '\\':
                        output += std::to_string(int('\\')) + " , ";
                        node->strLen--;
                        i++;
                        break;

                    case 'r':
                        output += std::to_string(int('\r')) + " , ";
                        node->strLen--;
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

            // pop comma and space off of string
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

// post order actions for pass that performs preprocessing for function declarations, variable declarations, parameters, and literals
void postGlobPass(AST *node)
{
    switch (node->name)
    {
    // store offset for man func decl
    case mainfunctiondeclaration:
        node->offsetCount = offsetCount;
        offsetCount = 4;
        break;

    // store offsets for func decls
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

// pre order actions for primary pass where code generation takes place
void preSecondPass(AST *node)
{

    switch (node->name)
    {

    // handles && and || short circuit operation
    case binop:
    {
        // regs for left and right operands of op
        std::string left;
        std::string right;

        // reg for op type
        std::string opReg;

        std::string lfLabel;
        std::string endLabel;

        // handle AND short circuit operation
        if (node->attribute == "&&")
        {
            shortCirCount++;
            lfLabel = "and_left_false" + std::to_string(shortCirCount);
            endLabel = "and_end" + std::to_string(shortCirCount);

            // perform traversal of left operand
            prePostOrder(node->children[0], &preSecondPass, &postSecondPass);

            if (node->children[0]->name == identifier)
            {
                // load ID if identifier
                left = reserveReg();
                genLoadID(node->children[0], left);
            }
            else if (node->children[0]->name == assignment)
            {
                // load child ID if identifier
                left = reserveReg();
                genLoadID(node->children[0]->children[0], left);
            }

            else
            {
                left = node->children[0]->reg;
            }

            opReg = reserveReg();
            genArithInst("beq", left, "$0", lfLabel);

            // perform traversal of right operand
            prePostOrder(node->children[1], &preSecondPass, &postSecondPass);
            if (node->children[1]->name == identifier)
            {

                right = reserveReg();
                genLoadID(node->children[1], right);
            }
            else if (node->children[1]->name == assignment)
            {
                right = reserveReg();
                genLoadID(node->children[1]->children[0], right);
            }

            else
            {

                right = node->children[1]->reg;
            }

            genDoubleInst("move", opReg, right);
            genSingleInst("j", endLabel);

            std::cout << lfLabel << ":" << std::endl;
            genDoubleInst("li", opReg, "0");

            std::cout << endLabel << ":" << std::endl;
            node->reg = opReg;

            freeReg(left);

            // free right reg if it was used
            if (!right.empty())
            {
                freeReg(right);
            }
            node->prune = true;
        }

        // handle OR short circuit operation
        else if (node->attribute == "||")
        {
            shortCirCount++;
            lfLabel = "or_left_true" + std::to_string(shortCirCount);
            endLabel = "or_end" + std::to_string(shortCirCount);

            // traverse left operand
            prePostOrder(node->children[0], &preSecondPass, &postSecondPass);

            if (node->children[0]->name == identifier)
            {
                // load ID if identifier
                left = reserveReg();
                genLoadID(node->children[0], left);
            }
            else if (node->children[0]->name == assignment)
            {
                // load child's ID if assignment
                left = reserveReg();
                genLoadID(node->children[0]->children[0], left);
            }

            else
            {

                left = node->children[0]->reg;
            }

            opReg = reserveReg();

            genArithInst("bne", left, "$0", lfLabel);

            // traverse right operand
            prePostOrder(node->children[1], &preSecondPass, &postSecondPass);

            if (node->children[1]->name == identifier)
            {
                // load ID if identifier
                right = reserveReg();
                genLoadID(node->children[1], right);
            }
            else if (node->children[1]->name == assignment)
            {
                // load child's ID if assignment
                right = reserveReg();
                genLoadID(node->children[1]->children[0], right);
            }

            else
            {

                right = node->children[1]->reg;
            }

            genDoubleInst("move", opReg, right);
            genSingleInst("j", endLabel);

            std::cout << lfLabel << ":" << std::endl;
            genDoubleInst("li", opReg, "1");
            std::cout << endLabel << ":" << std::endl;

            node->reg = opReg;
            freeReg(left);

            // free right reg if used
            if (!right.empty())
            {
                freeReg(right);
            }

            // prune the traversal
            node->prune = true;
        }
    }
    break;

    case mainfunctiondeclaration:

        std::cout << maindec;
        // prepare stack
        genArithInst("addiu", "$sp", "$sp", std::to_string(-node->offsetCount));

        break;

    case functiondeclarator:

        node->children[0]->symbolRef->label = "_" + node->children[0]->symbolRef->symbol;
        globRetLabel = node->children[0]->symbolRef->label + "_end"; //

        std::cout << text;
        std::cout << node->children[0]->symbolRef->label << ":" << std::endl;

        // prepare stack
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

        std::string tempLabel;
        std::string reg;
        std::cout << node->altLabel << ":" << std::endl;

        // load ID if identifier
        if (node->children[0]->name == identifier && node->children[0]->symbolRef->paramTypes.empty())
        {
            reg = reserveReg();
            genLoadID(node->children[0], reg);
        }

        // load child's ID if assignment
        else if (node->children[0]->name == assignment)
        {
            reg = reserveReg();
            genLoadID(node->children[0]->children[0], reg);
        }

        else
        {
            // perform traversal of nested contents
            prePostOrder(node->children[0], &preSecondPass, &postSecondPass);
            reg = node->children[0]->reg;
        }

        // create intermediate label and jump to it too avoid overflow of BEQ
        genArithInst("beq", reg, "$0", "intermediate_" + node->label);
        genSingleInst("j", "intermediate_end" + node->label);

        std::cout << "intermediate_" << node->label << ":" << std::endl;
        genSingleInst("j", node->label);

        std::cout << "intermediate_end" << node->label << ":" << std::endl;
        freeReg(reg);

        if (node->children[1]->name == block && !node->children[1]->children.empty())
        {
            // traverse children in block
            tempLabel = globBreakLabel;
            globBreakLabel = node->label;
            prePostOrder(node->children[1], &preSecondPass, &postSecondPass);
            globBreakLabel = tempLabel;
        }

        else if (!node->children.empty() && node->children[1]->name != block)
        {
            // traverse single child if while does not have a block
            tempLabel = globBreakLabel;
            globBreakLabel = node->label;
            prePostOrder(node->children[1], &preSecondPass, &postSecondPass);
            globBreakLabel = tempLabel;
        }

        genSingleInst("j", node->altLabel);

        // prune the traversal
        node->prune = true;

        std::cout << node->label << ":" << std::endl;
    }

    break;

    case breakstm:
    {
        node->label = globBreakLabel;
        genSingleInst("j", node->label);
    }

    break;

    case ifstm:
    {

        node->label = "if" + std::to_string(ifStmtCount);
        node->altLabel = "elseIf" + std::to_string(ifStmtCount);

        ifStmtCount++;
        std::string reg;

        // load ID if identifier
        if (node->children[0]->name == identifier && node->children[0]->symbolRef->paramTypes.empty())
        {
            reg = reserveReg();
            genLoadID(node->children[0], reg);
        }

        // load child's ID if assignment
        else if (node->children[0]->name == assignment)
        {
            reg = reserveReg();
            genLoadID(node->children[0]->children[0], reg);
        }

        else
        {
            // traverse nested contents
            prePostOrder(node->children[0], &preSecondPass, &postSecondPass);
            reg = node->children[0]->reg;
        }

        // handle if else statements with extra jump
        if (node->nodeType == "if else statement")
        {
            // use intermediate labels
            genArithInst("beq", reg, "$0", "intermediate_" + node->altLabel);
            genSingleInst("j", "intermediate_end" + node->altLabel);
            std::cout << "intermediate_" << node->altLabel << ":" << std::endl;
            genSingleInst("j", node->altLabel);
            std::cout << "intermediate_end" << node->altLabel << ":" << std::endl;
        }
        else
        {
            // use intermediate labels
            genArithInst("beq", reg, "$0", "intermediate_" + node->label);
            genSingleInst("j", "intermediate_end" + node->label);
            std::cout << "intermediate_" << node->label << ":" << std::endl;
            genSingleInst("j", node->label);
            std::cout << "intermediate_end" << node->label << ":" << std::endl;
        }
        freeReg(reg);

        // traverse children in block
        if (node->children[1]->name == block && !node->children[1]->children.empty())
        {
            prePostOrder(node->children[1], &preSecondPass, &postSecondPass);
        }

        // traverse single child if missing a block
        else if (!node->children.empty() && node->children[1]->name != block)
        {
            prePostOrder(node->children[1], &preSecondPass, &postSecondPass);
        }

        // traverse else contents
        if (node->nodeType == "if else statement" && !node->children[1]->children.empty())
        {
            genSingleInst("j", node->label); // ***POSSIBLE - ERROR IMPORTANT LOOK INTO POSITIONING ONE LINE AFTER LATER ***
            std::cout << node->altLabel << ":" << std::endl;
            prePostOrder(node->children[2], &preSecondPass, &postSecondPass);
        }

        // prune the traversal
        node->prune = true;

        std::cout << node->label << ":" << std::endl;
    }

    break;

    default:
        break;
    }
}

// post order actions for primary pass where code generation takes place
void postSecondPass(AST *node)
{

    switch (node->name)
    {

    case mainfunctiondeclaration:
        // prepare (close) stack
        genArithInst("addiu", "$sp", "$sp", std::to_string(node->offsetCount));
        genHalt();
        break;

    case functiondeclaration:
    {
        int offset;
        std::string sym;
        // handle end labels and offsets for func decls
        if (!(node->children[0]->children[0]->name == type))
        {
            std::cout << node->children[0]->children[0]->children[0]->symbolRef->label << "_end:" << std::endl;
            offset = node->children[0]->children[0]->offsetCount;
        }
        else
        {
            // handle missing labels in code execution
            sym = node->children[0]->children[1]->children[0]->symbolRef->symbol;
            genRetError("\"Error: function \'" + sym + "\' must return a value\\n\"");
            std::cout << node->children[0]->children[1]->children[0]->symbolRef->label << "_end:" << std::endl;
            offset = node->children[0]->children[1]->offsetCount;
        }

        // prepare (close) stack
        genPopStack("$ra", 0);
        genArithInst("addiu", "$sp", "$sp", std::to_string(offset));
        genSingleInst("jr", "$ra");
        paramCount = 0;
    }
    break;

    case returnstm:
    {
        std::string reg;

        // handle case where ret value is id
        if (!node->children.empty() && node->children[0]->name == identifier)
        {
            reg = reserveReg();
            genLoadID(node->children[0], reg);
            genDoubleInst("move", "$v0", reg);
            freeReg(reg);
            genSingleInst("j", globRetLabel);
        }

        // handle case where ret value is assignment
        else if (!node->children.empty() && node->children[0]->name == assignment)
        {

            reg = reserveReg();
            genLoadID(node->children[0]->children[0], reg);
            genDoubleInst("move", "$v0", reg);
            freeReg(reg);
            genSingleInst("j", globRetLabel);
        }

        // handle all other cases
        else if (!node->children.empty())
        {
            reg = node->children[0]->reg;
            genDoubleInst("move", "$v0", reg);
            freeReg(reg);
            genSingleInst("j", globRetLabel);
        }

        // handle case where function is void
        else if (node->children.empty())
        {
            genSingleInst("j", globRetLabel);
        }
    }
    break;

    case assignment:
    {
        std::string reg;

        // handle simple ID assignment
        if (node->children[1]->name == identifier)
        {
            reg = reserveReg();
            genLoadID(node->children[1], reg);
            genStoreID(node->children[0], reg);
            freeReg(reg);
        }

        // handle nested assignment
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

        // detect and generate code for runtime function calls
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

        // handle regular function calls
        else
        {

            jumpLabel = node->children[0]->symbolRef->label;

            // handle calls with arguments
            if (node->children[1] != nullptr && node->children[1]->name == argumentlist)
            {
                regs = getReserved();
                genArgs(node->children[1]);
                saveRegisters(regs);
                genSingleInst("jal", jumpLabel);
                loadRegisters(regs);

                std::string reg = reserveReg();
                genDoubleInst("move", reg, "$v0");
                node->reg = reg;

                if (node->nodeType == "void")
                {
                    freeReg(reg);
                }
            }

            // handle calls with no arguments
            else
            {
                regs = getReserved();
                saveRegisters(regs);
                genSingleInst("jal", jumpLabel);
                loadRegisters(regs);
                std::string reg = reserveReg();
                genDoubleInst("move", reg, "$v0");
                node->reg = reg;
                if (node->nodeType == "void")
                {
                    freeReg(reg);
                }
            }
        }
    }
    break;

    case unop:
    {
        std::string operand;

        // handle ops with IDs
        if (node->children[0]->name == identifier && node->children[0]->symbolRef->paramTypes.empty())
        {
            operand = reserveReg();
            genLoadID(node->children[0], operand);
        }

        // handle ops with assignments
        else if (node->children[0]->name == assignment)
        {
            operand = reserveReg();
            genLoadID(node->children[0]->children[0], operand);
        }

        else
        {
            operand = node->children[0]->reg;
        }

        std::string opReg = reserveReg();

        // unary minus
        if (node->attribute == "-")
        {
            genArithInst("subu", opReg, "$0", operand);
        }

        // unary not
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

        std::string left, right;

        // handle left ops with IDs
        if (node->children[0]->name == identifier && node->children[0]->symbolRef->paramTypes.empty())
        {
            left = reserveReg();
            genLoadID(node->children[0], left);
        }

        // handle left ops with assignments
        else if (node->children[0]->name == assignment)
        {
            left = reserveReg();
            genLoadID(node->children[0]->children[0], left);
        }

        else
        {
            left = node->children[0]->reg;
        }

        // handle right ops with IDs
        if (node->children[1]->name == identifier && node->children[1]->symbolRef->paramTypes.empty())
        {
            right = reserveReg();
            genLoadID(node->children[1], right);
        }

        // handle right ops with assignments
        else if (node->children[1]->name == assignment)
        {
            left = reserveReg();
            genLoadID(node->children[1]->children[0], left);
        }
        else
        {
            right = node->children[1]->reg;
        }
        std::string opReg = reserveReg(); //*****IMPORTANT*** remember to free opReg after it is used in func calls, assignments, etc.*****

        // addition
        if (node->attribute == "+")
        {
            genArithInst("addu", opReg, left, right);
        }

        // subtraction
        else if (node->attribute == "-")
        {
            genArithInst("subu", opReg, left, right);
        }

        // multiplication
        else if (node->attribute == "*")
        {
            genArithInst("mul", opReg, left, right);
        }

        // division
        else if (node->attribute == "/")
        {
            genArithInst("bne", right, "$0", "divNorm");
            // detect division by 0
            genRetError("\"Error: division by zero\\n\"");
            std::cout << "divNorm:" << std::endl;
            genArithInst("div", opReg, left, right);
        }

        // modulo
        else if (node->attribute == "%")
        {
            genArithInst("rem", opReg, left, right);
        }

        // equivalence
        else if (node->attribute == "==")
        {
            genArithInst("seq", opReg, left, right);
        }

        // not equal
        else if (node->attribute == "!=")
        {
            genArithInst("sne", opReg, left, right);
        }

        // greater than
        else if (node->attribute == ">")
        {
            genArithInst("sgt", opReg, left, right);
        }

        // less than
        else if (node->attribute == "<")
        {
            genArithInst("slt", opReg, left, right);
        }

        // less than and equal
        else if (node->attribute == "<=")
        {
            genArithInst("sle", opReg, left, right);
        }

        // greater than and equal
        else if (node->attribute == ">=")
        {
            genArithInst("sge", opReg, left, right);
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
        // simply assign 1 and 0s respectively to booleans
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

    // call pre and post-order traversals
    prePostOrder(root, &preGlobPass, &postGlobPass);
    prePostOrder(root, &preSecondPass, &postSecondPass);

    return EXIT_SUCCESS;
}