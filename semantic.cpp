#include "semantic.hpp"

// Create reference to symbol table
SymbolTable *table = new SymbolTable();

// Global Control flags
bool declAcceptType = false;
bool declAcceptID = false;
bool decl = false;
bool declRet = false;
bool needsRet = false;
bool declAcceptFormals = false;
bool acceptID = false;
bool acceptCallID = false;
bool acceptArgs = false;
bool argList = false;
bool stmtOp = false;
bool skipAssign = false;

// Global Counters
int mainCount = 0;
int ifCount = 0;
int whileCount = 0;
int opCount = 0;

//  Global SymbolTableEntries for intermediate/temporary operations
SymbolTableEntry *tempSymbolRef = new SymbolTableEntry();
SymbolTableEntry *tempCheckSymbolRef = new SymbolTableEntry();
SymbolTableEntry *globalRef = new SymbolTableEntry();

// Track assignment types
std::vector<std::string> assignOp;

// Track return type
std::string funcRet;

// Operation table for binary arithmetic type checking
// Key is operation and parameters; value is return type
std::map<std::vector<std::string>, std::string> opTable({

    {{"||", "boolean", "boolean"}, "boolean"},
    {{"&&", "boolean", "boolean"}, "boolean"},
    {{"==", "boolean", "boolean"}, "boolean"},
    {{"==", "integer", "integer"}, "boolean"},
    {{"!=", "boolean", "boolean"}, "boolean"},
    {{"!=", "integer", "integer"}, "boolean"},
    {{"=", "integer", "integer"}, "integer"},
    {{"=", "boolean", "boolean"}, "boolean"}, // {{"=", "integer", "integer"}, "boolean"},
    {{"<", "integer", "integer"}, "boolean"},
    {{">", "integer", "integer"}, "boolean"},
    {{"<=", "integer", "integer"}, "boolean"},
    {{">=", "integer", "integer"}, "boolean"},
    {{"+", "integer", "integer"}, "integer"},
    {{"*", "integer", "integer"}, "integer"},
    {{"/", "integer", "integer"}, "integer"},
    {{"%", "integer", "integer"}, "integer"},
    {{"-", "integer", "integer"}, "integer"},

});

// Operation table for unary arithmetic type checking
// Key is operation and parameters; value is return type
std::map<std::vector<std::string>, std::string> unOpTable({

    {{"-", "integer"}, "integer"},
    {{"!", "boolean"}, "boolean"},

});

// return the types of children corresponding to a given node
std::vector<std::string> getChildrenTypes(AST *node)
{

    std::vector<std::string> types;
    for (auto child : node->children)
    {
        // handle children with no symbol table reference
        if (child->name == unop || child->name == binop || child->name == literal ||
            child->name == functioncall || child->name == assignment)
        {
            types.push_back(child->nodeType);
        }

        else
        {
            if (!(child->symbolRef->paramTypes.empty()))
            {
                exit(semanticError("mismatched types for assignment", node->lineNum));
            }
            types.push_back(child->symbolRef->type);
        }
    }

    return types;
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

    for (auto child : node->children)
    {
        prePostOrder(child, preAction, postAction);
    }

    postAction(node);
}

// Pre order actions for binary and unary operation type checking
void opType(AST *node)
{
    opCount++;

    // If identifier is assigned an op, track the resolved type of the op
    if (acceptID && !acceptArgs)
    {
        assignOp.push_back(node->nodeType);
        acceptID = false;
    }

    // if arguments contain ops, track resolved types of the ops
    if (acceptArgs)
    {

        tempSymbolRef->paramTypes.push_back(node->nodeType);
        acceptArgs = false;
    }

    // if return statement contains op, check if function dec is void or if the return type is wrong
    if (declRet)
    {
        if (funcRet == "void")
            exit(semanticError("void function returns a value", node->lineNum));
        if (funcRet != node->nodeType)
            exit(semanticError("returned value has the wrong type", node->lineNum));
        declRet = false;
        needsRet = false;
    }

    // if conditional contains op, check if op is not boolean
    if (stmtOp)
    {
        if (node->nodeType != "boolean")
            exit(semanticError("Need a boolean in conditional", node->lineNum));
        stmtOp = false;
    }
}

// Pre order actions for identifier and literal type checking
void idType(AST *node, const NodeName value)
{
    // if conditional contains id/literal, check if id/literal is not boolean
    if (stmtOp)
    {

        if (value == identifier)
        {
            if (node->symbolRef->type != "boolean")
                exit(semanticError("Need a boolean in conditional", node->lineNum));
        }
        else
        {
            if (node->nodeType != "boolean")
                exit(semanticError("Need a boolean in conditional", node->lineNum));
        }

        stmtOp = false;
    }

    // if identifier is for function decl, track return type and set flag if it is void
    if (decl)
    {
        if (value == identifier)
            funcRet = node->symbolRef->type;

        else
        {
            funcRet = node->nodeType;
        }
        if (funcRet != "void")
            needsRet = true;

        decl = false;
    }

    // if identifier/literal is function decl return, compare return to function decl type, and
    // check if return type is void or mismatched
    if (declRet)
    {
        if (funcRet == "void")
            exit(semanticError("void function returns a value", node->lineNum));

        if (value == identifier)
        {
            if (funcRet != node->symbolRef->type)
                exit(semanticError("returned value has the wrong type", node->lineNum));
        }
        else
        {
            if (funcRet != node->nodeType)
                exit(semanticError("returned value has the wrong type", node->lineNum));
        }
        declRet = false;
        needsRet = false;
    }

    // if identifier/literal is for id/lit -> id/lit assignment, track type of id/lit
    if ((acceptID) && !acceptCallID && !acceptArgs)
    {
        if (value == identifier)
            assignOp.push_back(node->symbolRef->type);

        else
        {
            assignOp.push_back(node->nodeType);
        }
    }

    // if identifier/literal is for function call, track return type and args, and
    // check for mismatched types
    if (acceptCallID)
    {

        tempCheckSymbolRef->clear();

        // if function call is made without assignment, track the resolved return type
        // to skip error checking
        if (assignOp.empty())
            assignOp.push_back(node->symbolRef->type);

        // track return types and args
        tempCheckSymbolRef->paramTypes = node->symbolRef->paramTypes;
        tempCheckSymbolRef->type = node->symbolRef->type;

        if (assignOp.back() != tempCheckSymbolRef->type)
        {
            exit(semanticError("mismatched types for assignment", node->lineNum));
        }
        else
        {
            skipAssign = true;
        }
        acceptCallID = false;
    }

    // if identifier/literal is for list of args, track each arg
    if (acceptArgs)
    {
        if (value == identifier)
            tempSymbolRef->paramTypes.push_back(node->symbolRef->type);
        else
        {
            tempSymbolRef->paramTypes.push_back(node->nodeType);
        }
    }
}

// Pre order action for global declaration pass
void preGlobalDecs(AST *node)
{
    switch (node->name)
    {

    // set flags to to handle function declaration
    case functionheader:
        tempSymbolRef->clear();
        if (node->nodeType == "void")
        {
            tempSymbolRef->type = "void";
            declAcceptID = true;
        }
        else
        {
            declAcceptType = true;
            declAcceptID = true;
        }
        break;

    // set flags to handle variable declaration
    case variabledeclaration:
        tempSymbolRef->clear();

        // ensure that variable is global
        if (table->scope == 2)
        {
            declAcceptType = true;
            declAcceptID = true;
        }
        break;

    // check for multiple main declarations
    case mainfunctiondeclaration:
        // open seperate scope for main func decl
        table->openScope();
        mainCount++;
        if (mainCount > 1)
        {
            exit(semanticError("Multiple main declarations", node->lineNum));
        }
        break;

    // track types for variable decls and function decls and params
    case type:
        if (declAcceptType)
        {
            tempSymbolRef->type = node->nodeType;
            declAcceptType = false;
        }

        if (declAcceptFormals)
        {
            // update global func symbol table entry with param types
            globalRef = table->lookup(tempSymbolRef->symbol);
            globalRef->paramTypes.push_back(node->nodeType);
        }
        break;

    // define new symbol table entry for global variable and func identifiers
    case identifier:
        if (declAcceptID)
        {
            tempSymbolRef->symbol = node->attribute;
            tempSymbolRef->scope = table->scope;
            tempSymbolRef->lineNum = node->lineNum;

            // create new symbol table and entry and define in table
            SymbolTableEntry *temp = new SymbolTableEntry(tempSymbolRef->symbol, tempSymbolRef->type, tempSymbolRef->scope, tempSymbolRef->lineNum);
            table->define(temp);
            node->symbolRef = temp;
            declAcceptID = false;
        }

        break;

    case formalparameterlist:
        declAcceptFormals = true;
        break;

    default:
        break;
    }
}

// Post order action for global declarations pass
void postGlobalDecs(AST *node)
{
    switch (node->name)
    {
    // check if there are no main decls
    case program:
        if (mainCount == 0)
        {
            exit(semanticError("No main declarations"));
        }

        break;

    // close main decl scope
    case mainfunctiondeclaration:
        table->closeScope();
        break;

    // open new scope for function params and body
    case functionheader:
        declAcceptFormals = false;
        table->openScope();
        break;

    // close func decl scope
    case functiondeclaration:
        table->closeScope();
        break;

    default:
        break;
    }
}

// Pre order actions for identifiers pass
void preIDs(AST *node)
{

    switch (node->name)
    {

    // open new local scope for func decls
    case functiondeclaration:
        table->openScope();
        break;

    // open new scope for main func decl
    case mainfunctiondeclaration:
        table->openScope();
        break;

    // set flags to handle local variable decls
    case variabledeclaration:
        tempSymbolRef->clear();

        // ensure that variables are local
        if (table->scope == 3)
        {
            declAcceptType = true;
            declAcceptID = true;
        }
        break;

    case assignment:
        acceptID = true;
        break;

    case argumentlist:
        acceptArgs = true;
        break;

    case functioncall:
        acceptID = true;
        acceptCallID = true;
        break;

    case ifstm:
        acceptID = true;
        break;

    case whilestm:
        acceptID = true;
        break;

    case returnstm:
        acceptID = true;
        break;

    // set flags to handle local function parameters
    case formalparameter:
        tempSymbolRef->clear();
        if (table->scope == 3)
        {
            declAcceptType = true;
            declAcceptID = true;
        }
        break;

    // set flags to handle types
    case type:
        if (table->scope == 3 && declAcceptType)
        {
            tempSymbolRef->type = node->nodeType;
            declAcceptType = false;
        }
        break;

    // define new symbol table entry for local declarations and handle local assignments
    case identifier:

        // handle local declarations
        if (table->scope == 3 && declAcceptID)
        {
            tempSymbolRef->symbol = node->attribute;
            tempSymbolRef->lineNum = node->lineNum;
            tempSymbolRef->scope = table->scope;

            // create new symbol table entry and define in symbol table
            SymbolTableEntry *temp = new SymbolTableEntry(tempSymbolRef->symbol, tempSymbolRef->type, tempSymbolRef->scope, tempSymbolRef->lineNum);
            table->define(temp);
            node->symbolRef = temp;
            declAcceptID = false;
        }

        // check if main is called and for identifiers that do not appear in the symbol table
        // store symbol table enteries in AST
        if ((table->scope == 3 && acceptID) || (table->scope == 3 && acceptArgs))
        {

            // if symbol table entry exists, store in AST
            SymbolTableEntry *temp;
            if (acceptCallID)
            {
                temp = table->lookupGlobal(node->attribute);
                acceptCallID = false;
            }
            else
            {
                temp = table->lookup(node->attribute);
            }
            if (temp != nullptr)
            {
                node->symbolRef = temp;
            }
            else
            {
                exit(semanticError("Undefined identifier", node->lineNum));
            }
        }

        break;

    default:
        break;
    }
}

// Post order actions for identifiers pass
void postIDs(AST *node)
{

    switch (node->name)
    {

    // close func decl scope
    case functiondeclaration:
        table->closeScope();
        break;

    // close main func decl scope
    case mainfunctiondeclaration:
        table->closeScope();
        break;

    case assignment:
        acceptID = false;
        break;

    case argumentlist:
        acceptID = false;
        break;

    case functioncall:
        acceptID = false;
        acceptCallID = false;
        break;

    case ifstm:
        acceptID = false;
        break;

    case whilestm:
        acceptID = false;
        break;

    case returnstm:
        acceptID = false;
        break;

    default:
        break;
    }
}

// Post order traversal for arithmetic type checking
void postArith(AST *node)
{
    switch (node->name)
    {

    // handle binary operations
    case binop:
    {
        // left bin operand
        std::string lOp;

        // right bin operand
        std::string rOp;

        // get left child node type if it is a unop, binop, or a literal
        if (node->children[0]->name == unop || node->children[0]->name == binop || node->children[0]->name == literal)
        {
            lOp = node->children[0]->nodeType;
        }

        // get left child node type if it is an identifier
        else
        {
            lOp = node->children[0]->symbolRef->type;
        }

        // get right child node type if it is a unop, binop, or a literal
        if (node->children[1]->name == unop || node->children[1]->name == binop || node->children[1]->name == literal)
        {
            rOp = node->children[1]->nodeType;
        }

        // get right node type child if it is an identifier
        else
        {
            rOp = node->children[1]->symbolRef->type;
        }

        // find return type corresponding to operation and operands
        // prompt error if not found
        auto ret = opTable.find({node->attribute, lOp, rOp});
        if (ret != opTable.end())
        {
            // store resolved type in AST node
            node->nodeType = ret->second;
        }

        else
        {
            exit(semanticError("mismatched types for '" + node->attribute + "' operation", node->lineNum));
        }
    }
    break;

    case unop:
    {
        // single operand for unop
        std::string op;

        // get child node type if it is a unop, binop, or a literal
        if (node->children[0]->name == unop || node->children[0]->name == binop || node->children[0]->name == literal)
        {
            op = node->children[0]->nodeType;
        }

        // get child node type if it an identifier
        else
        {
            op = node->children[0]->symbolRef->type;
        }

        // find return type corresponding to operation and operands
        // prompt error if not found
        auto ret = unOpTable.find({node->attribute, op});
        if (ret != unOpTable.end())
        {
            node->nodeType = ret->second;
        }

        else
        {
            exit(semanticError("mismatched types for '" + node->attribute + "' operation", node->lineNum));
        }
    }
    break;

    default:
        break;
    }
}

// Pre order actions for type checking pass
void preTypes(AST *node)
{

    switch (node->name)
    {

    // set flags for func decl
    case functiondeclaration:
        funcRet.clear();
        decl = true;
        break;

        // set flags for func call
        /* case functioncall:
            tempSymbolRef->clear();
            acceptCallID = true;
            break; */

        // set flags for func args
        /* case argumentlist:
            acceptArgs = true;
            argList = true;
            break; */

        // set flags for assignment
        /* case assignment:

            assignOp.clear();
            acceptID = true;
            break; */

    case whilestm:
        stmtOp = true;
        break;

    case ifstm:
        stmtOp = true;
        break;

    case returnstm:
        declRet = true;
        break;

    // call helper function to handle ops
    case binop:
        opType(node);
        break;
    case unop:
        opType(node);
        break;

    // call helper function to handle ids and literals
    case literal:
        idType(node, node->name);
        break;

    case identifier:
        idType(node, node->name);
        break;

    default:
        break;
    }
}

// Post order actions for initial type checking pass
void postTypes(AST *node)
{
    switch (node->name)
    {
    case functiondeclaration:
        if (needsRet == true)
            exit(semanticError("non-void function missing return statement", node->lineNum));
        break;

    // handle all assignment cases
    case assignment:
    {
        std::string lOp;
        std::string rOp;

        lOp = node->children[0]->symbolRef->type;
        if (!(node->children[0]->symbolRef->paramTypes.empty()))
        {
            exit(semanticError("mismatched types for assignment", node->lineNum));
        }

        // get right child node type if it is a unop, binop, literal, or function call
        if (node->children[1]->name == unop || node->children[1]->name == binop || node->children[1]->name == literal ||
            node->children[1]->name == functioncall || node->children[1]->name == assignment)
        {
            rOp = node->children[1]->nodeType;
        }
        // get right node type child if it is an identifier
        else
        {
            rOp = node->children[1]->symbolRef->type;
        }

        // check if a func id is incorrectly being used as a variable id
        if (node->children[1]->name == identifier && !(node->children[1]->symbolRef->paramTypes.empty()))
        {
            exit(semanticError("mismatched types for assignment", node->lineNum));
        }

        // check if the assignment operands do not match
        if (lOp != rOp)
        {
            exit(semanticError("mismatched types for assignment", node->lineNum));
        }
        else
        {
            node->nodeType = lOp;
        }
    }
    break;

    // hand all function call cases
    case functioncall:
    {
        node->attribute = "sig";
        node->nodeType = node->children[0]->symbolRef->type;
        std::vector<std::string> types = node->children[0]->symbolRef->paramTypes;

        // check if main function is being called
        if (node->children[0]->attribute == "main")
        {
            exit(semanticError("Main function called", node->lineNum));
        }

        // if there are arguments, check if the arguments match in type
        if (node->children[1] != nullptr)
        {
            if (types.size() != getChildrenTypes(node->children[1]).size())
                exit(semanticError("Incorrect number of arguments", node->lineNum));

            if (types != getChildrenTypes(node->children[1]))
                exit(semanticError("Incorrect argument types", node->lineNum));
        }

        else
        {
            if (!types.empty())
                exit(semanticError("Incorrect number of arguments", node->lineNum));
        }
    }
    break;

    default:
        break;
    }
}

// Pre order actiosn for general/catch-all pass
void preGeneral(AST *node)
{
    switch (node->name)
    {

    // Track occurances of if and while statements
    case whilestm:
        whileCount++;
        break;

    case ifstm:
        ifCount++;
        break;

    // check if a break is encountered outside of a while loop
    case breakstm:
        if (whileCount == 0)
        {
            exit(semanticError("break statement not in while statement", node->lineNum));
        }
    // check if a variable declaration does not occur in the outermost block
    case variabledeclaration:
        if (whileCount != 0 || ifCount != 0)
        {
            exit(semanticError("local declaration found in while of if statement", node->lineNum));
        }

    default:
        break;
    }
}

// Post order actions for general/catch-all pass
void postGeneral(AST *node)
{
    switch (node->name)
    {

    // decrement count of if and while statements after traversing them
    case whilestm:
        whileCount--;
        break;
    case ifstm:
        ifCount--;
        break;

    default:
        break;
    }
}

int semanticAnalyzer(AST *root)
{

    // open predefined scope
    table->openScope();

    // define predefined runtime library functions
    table->define(new SymbolTableEntry("getchar", "integer", table->scope, 0));
    table->define(new SymbolTableEntry("halt", "void", table->scope, 0));
    table->define(new SymbolTableEntry("printb", "void", {"boolean"}, table->scope, 0));
    table->define(new SymbolTableEntry("printc", "void", {"integer"}, table->scope, 0));
    table->define(new SymbolTableEntry("printi", "void", {"integer"}, table->scope, 0));
    table->define(new SymbolTableEntry("prints", "void", {"string"}, table->scope, 0));

    // open global scope
    table->openScope();

    // perform AST traversals for each pass
    prePostOrder(root, &preGlobalDecs, &postGlobalDecs);
    prePostOrder(root, &preIDs, &postIDs);
    postOrder(root, &postArith);
    prePostOrder(root, &preTypes, &postTypes);
    prePostOrder(root, &preGeneral, &postGeneral);

    // close global scope
    table->closeScope();

    // close predefined scope
    table->closeScope();

    return EXIT_SUCCESS;
}

// Output error message and exit in failure
int semanticError(std::string message, int line)
{
    std::cerr << "Semantic Error: " << message << " on or near line " << line << std::endl;
    return EXIT_FAILURE;
}

// Output error message and exit in failure
int semanticError(std::string message)
{
    std::cerr << "Semantic Error: " << message << std::endl;
    return EXIT_FAILURE;
}