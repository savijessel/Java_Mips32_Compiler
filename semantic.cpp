#include "semantic.hpp"

SymbolTable *table = new SymbolTable();
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
int mainCount = 0;
int ifCount = 0;
int whileCount = 0;
SymbolTableEntry *tempSymbolRef = new SymbolTableEntry();
SymbolTableEntry *tempCheckSymbolRef = new SymbolTableEntry();
SymbolTableEntry *globalRef = new SymbolTableEntry();
std::vector<std::string> assignOp;
std::vector<std::string> binaryOp;
std::string funcRet;
int argCount = 0;
int opCount = 0;
/* std::unordered_multimap<std::string, std::vector<std::string>> opTable({

    {"||", {"boolean", "boolean", "boolean"}},
    {"&&", {"boolean", "boolean", "boolean"}},
    {"==", {"boolean", "boolean", "boolean"}},
    {"==", {"boolean", "integer", "integer"}},
    {"!=", {"boolean", "boolean", "boolean"}},
    {"!=", {"boolean", "integer", "integer"}},
    {"=", {"integer", "integer", "integer"}},
    {"=", {"boolean", "integer", "integer"}},
    {"<", {"boolean", "integer", "integer"}},
    {">", {"boolean", "integer", "integer"}},
    {"<=", {"boolean", "integer", "integer"}},
    {">=", {"boolean", "integer", "integer"}},
    {"+", {"integer", "integer", "integer"}},
    {"*", {"integer", "integer", "integer"}},
    {"/", {"integer", "integer", "integer"}},
    {"%", {"integer", "integer", "integer"}},
    {"-", {"integer", "integer", "integer"}},
    {"-", {"integer", "integer"}},
    {"!", {"boolean", "boolean"}},

});
 */
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

std::map<std::vector<std::string>, std::string> unOpTable({

    {{"-", "integer"}, "integer"},
    {{"!", "boolean"}, "boolean"},

});

/* void opType(AST *node)
{
    if (acceptArgs)
    {
        std::vector<std::string> tempOp;
        tempOp.push_back(tempCheckSymbolRef->paramTypes[argCount]);
        for (auto t : binaryOp)
            tempOp.push_back(t);
        bool error = true;
        auto its = opTable.equal_range(node->nodeType);
        for (auto it = its.first; it != its.second; it++)
        {
            for (auto s : it->second)
                std::cout << "hash: " << s << std::endl;
            for (auto s : tempOp)
                std::cout << "assignOp: " << s << std::endl;
            if (it->second == tempOp)
                error = false;
        }
        acceptIDs = false;
        binaryOp.clear();
        if (error)
            exit(semanticError("mismatched types for '" + node->nodeType + "' operation", node->lineNum));
        tempSymbolRef->paramTypes.push_back(binaryOp.front());
    }

    else
    {

        bool error = true;
        auto its = opTable.equal_range(node->nodeType);
        std::string retVal;
        for (auto it = its.first; it != its.second; it++)
        {

            if (!stmtOp)
            {
                if (it->second == assignOp)
                    error = false;
            }
            else
            {
                std::vector<std::string> temp = it->second;
                if (declRet)
                    retVal = temp.front();
                temp.erase(temp.begin());
                if (temp == binaryOp)
                    error = false;
            }
        }
        acceptIDs = false;
        assignOp.clear();
        binaryOp.clear();
        if (error)
            exit(semanticError("mismatched types for '" + node->nodeType + "' operation", node->lineNum));
        if (declRet)
        {
            needsRet = false;
            declRet = false;
            if (retVal != funcRet)
                exit(semanticError("returned value has the wrong type", node->lineNum));
        }
    }
    stmtOp = false;
} */
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

void preOrder(AST *node, std::function<void(AST *)> action)
{

    if (node == nullptr)
        return;

    action(node);

    for (auto child : node->children)
    {
        postOrder(child, action);
    }
}

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

void opType(AST *node)
{
    opCount++;
    if (acceptID)
    {
        assignOp.push_back(node->nodeType);
        acceptID = false;
    }

    if (acceptArgs)
    {

        tempSymbolRef->paramTypes.push_back(node->nodeType);
        acceptArgs = false;
    }

    if (declRet)
    {
        if (funcRet == "void")
            exit(semanticError("void function returns a value", node->lineNum));
        if (funcRet != node->nodeType)
            exit(semanticError("returned value has the wrong type", node->lineNum));
        declRet = false;
        needsRet = false;
    }

    if (stmtOp)
    {
        if (node->nodeType != "boolean")
            exit(semanticError("Need a boolean in conditional", node->lineNum));
        stmtOp = false;
    }
}

void idType(AST *node, const NodeName value)
{
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

    if (declRet)
    {
        if (funcRet == "void")
            exit(semanticError("void function returns a value", node->lineNum));
        if (value == identifier)
        {
            std::cout << "funcRet: " << funcRet << std::endl;
            std::cout << "node: " << node->symbolRef->type << std::endl;
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

    if ((acceptID) && !acceptCallID && !acceptArgs)
    {
        if (value == identifier)
            assignOp.push_back(node->symbolRef->type);
        else
        {
            assignOp.push_back(node->nodeType);
        }
    }

    if (acceptCallID)
    {

        tempCheckSymbolRef->clear();
        if (assignOp.empty())
            assignOp.push_back(node->symbolRef->type);

        tempCheckSymbolRef->paramTypes = node->symbolRef->paramTypes;
        tempCheckSymbolRef->type = node->symbolRef->type;
        std::cout << "test1" << std::endl;
        // node->symbolRef->print();
        //  binaryOp.push_back(node->symbolRef->type);
        acceptCallID = false;
    }

    if (acceptArgs)
    {
        argCount++;
        if (value == identifier)
            tempSymbolRef->paramTypes.push_back(node->symbolRef->type);
        else
        {
            tempSymbolRef->paramTypes.push_back(node->nodeType);
        }
    }
}

void preGlobalDecs(AST *node)
{
    switch (node->name)
    {
    case functionheader:
        tempSymbolRef->clear();
        if (node->nodeType == "void")
        {
            tempSymbolRef->type = "void";
            globalRef->type = "void";
            declAcceptID = true;
        }
        else
        {
            declAcceptType = true;
            declAcceptID = true;
        }
        break;

    case variabledeclaration:
        tempSymbolRef->clear();
        // std::cout << "table->scope:" << table->scope << std::endl;
        if (table->scope == 2)
        {
            declAcceptType = true;
            declAcceptID = true;
        }
        break;

    case mainfunctiondeclaration:
        table->openScope();
        mainCount++;
        if (mainCount > 1)
        {
            exit(semanticError("Multiple main declarations", node->lineNum));
        }
        break;

    case type:
        if (declAcceptType)
        {
            tempSymbolRef->type = node->nodeType;
            globalRef->type = node->nodeType;
            declAcceptType = false;
        }

        if (declAcceptFormals)
        {
            tempSymbolRef->paramTypes.push_back(node->nodeType);
            globalRef->paramTypes.push_back(node->nodeType);
        }
        break;

    case identifier:
        if (declAcceptID)
        {
            tempSymbolRef->symbol = node->attribute;
            tempSymbolRef->scope = table->scope;
            tempSymbolRef->lineNum = node->lineNum;
            std::cout << "pint01" << std::endl;
            globalRef->symbol = node->attribute;
            globalRef->scope = table->scope;
            globalRef->lineNum = node->lineNum;
            node->symbolRef = globalRef;
            std::cout << "pint02" << std::endl;
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

void postGlobalDecs(AST *node)
{
    switch (node->name)
    {
    case program:
        if (mainCount == 0)
        {
            exit(semanticError("No main declarations"));
        }
        /*  if (table->lookup("hello") == nullptr)
             semanticError("No declaration", 5); */
        break;

    case mainfunctiondeclaration:
        table->closeScope();
        break;
    case functionheader:
        declAcceptFormals = false;
        table->define(*tempSymbolRef);
        table->openScope();
        break;
    case functiondeclaration:
        table->closeScope();
        break;
    default:
        break;
    }
}

void preIDs(AST *node)
{

    switch (node->name)
    {

    case functiondeclaration:
        table->openScope();
        break;

    case mainfunctiondeclaration:
        table->openScope();
        break;

    case variabledeclaration:
        tempSymbolRef->clear();
        if (table->scope == 3)
        {
            declAcceptType = true;
            declAcceptID = true;
        }
        break;

    case assignment:
        acceptID = true;
        break;

    case functioncall:
        acceptID = true;
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

    case formalparameter:
        tempSymbolRef->clear();
        if (table->scope == 3)
        {
            declAcceptType = true;
            declAcceptID = true;
        }
        break;

    case type:
        if (table->scope == 3 && declAcceptType)
        {
            tempSymbolRef->type = node->nodeType;
            declAcceptType = false;
        }

        break;
    case identifier:
        if (table->scope == 3 && declAcceptID)
        {
            tempSymbolRef->symbol = node->attribute;
            tempSymbolRef->lineNum = node->lineNum;
            tempSymbolRef->scope = table->scope;
            table->define(*tempSymbolRef);
            node->symbolRef = table->lookup(tempSymbolRef->symbol);
            declAcceptID = false;
        }

        if (table->scope == 3 && acceptID)
        {
            if (node->attribute == "main")
            {
                exit(semanticError("Main function called", node->lineNum));
            }
            if (table->lookup(node->attribute) != nullptr)
            {
                node->symbolRef = table->lookup(node->attribute);
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

void postIDs(AST *node)
{

    switch (node->name)
    {

    case functiondeclaration:
        table->closeScope();
        break;

    case mainfunctiondeclaration:
        table->closeScope();
        break;

    case assignment:
        acceptID = false;
        break;

    case functioncall:
        acceptID = false;
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

void preArith(AST *node)
{
}

void postArith(AST *node)
{
    switch (node->name)
    {

    case binop:
    {
        std::string lOp;
        std::string rOp;
        if (node->children[0]->name == unop || node->children[0]->name == binop || node->children[0]->name == literal)
        {
            lOp = node->children[0]->nodeType;
        }
        else
        {
            lOp = node->children[0]->symbolRef->type;
        }

        if (node->children[1]->name == unop || node->children[1]->name == binop || node->children[1]->name == literal)
        {
            rOp = node->children[1]->nodeType;
        }
        else
        {
            rOp = node->children[1]->symbolRef->type;
        }

        auto ret = opTable.find({node->attribute, lOp, rOp});
        if (ret != opTable.end())
        {
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

        std::string op;
        if (node->children[0]->name == unop || node->children[0]->name == binop || node->children[0]->name == literal)
        {
            op = node->children[0]->nodeType;
        }
        else
        {
            op = node->children[0]->symbolRef->type;
        }

        std::cout << "op1" << op << std::endl;
        std::cout << node->attribute << std::endl;
        auto ret = unOpTable.find({node->attribute, op});
        std::cout << "op2" << op << std::endl;
        if (ret != unOpTable.end())
        {
            std::cout << "op3" << op << std::endl;
            node->nodeType = ret->second;
            std::cout << "ret" << ret->second << std::endl;
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

void preTypes(AST *node)
{

    switch (node->name)
    {

    case functiondeclaration:
        funcRet.clear();
        decl = true;
        break;

    case functioncall:
        tempSymbolRef->clear();
        acceptCallID = true;
        break;

    case argumentlist:
        acceptArgs = true;
        argList = true;
        break;

    case assignment:
        assignOp.clear();
        acceptID = true;
        break;

    case whilestm:
        stmtOp = true;
        break;

    case ifstm:
        stmtOp = true;
        break;

    case returnstm:
        declRet = true;
        break;

    case binop:
        opType(node);
        break;
    case unop:
        opType(node);
        break;

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

void postTypes(AST *node)
{

    switch (node->name)
    {

    case functiondeclaration:
        if (needsRet == true)
            exit(semanticError("non-void function missing return statement", node->lineNum));
        break;
    case assignment:
        if (assignOp.size() == 2)
        {
            if (assignOp[0] != assignOp[1])
                exit(semanticError("mismatched types for assignment", node->lineNum));
        }

        acceptID = false;
        assignOp.clear();
        break;

    case binop:
    {
        opCount--;
        if (argList)
        {
            if (opCount == 0)
                acceptArgs = true;
        }
        break;
    }
    case unop:
    {
        opCount--;
        if (argList)
        {
            if (opCount == 0)
                acceptArgs = true;
        }
        break;
    }

    case argumentlist:
        acceptArgs = false;
        argList = false;
        break;

    case functioncall:
        // std::cout << "tempSymbolRef: " << std::endl;
        // tempSymbolRef->print();
        // std::cout << "tempCheckSymbolRef: " << std::endl;
        // tempCheckSymbolRef->print();
        if (tempSymbolRef->paramTypes.size() != tempCheckSymbolRef->paramTypes.size())
            exit(semanticError("Incorrect number of arguments", node->lineNum));
        if (tempSymbolRef->paramTypes != tempCheckSymbolRef->paramTypes)
            exit(semanticError("Incorrect argument types", node->lineNum));
        if (assignOp.back() != tempCheckSymbolRef->type && tempCheckSymbolRef->type == "void")
        {
            exit(semanticError("Void function cannot return value", node->lineNum));
        }
        if (assignOp.back() != tempCheckSymbolRef->type)
            exit(semanticError("Mismatched return type", node->lineNum));

        break;

    default:
        break;
    }
}

void preGeneral(AST *node)
{
    switch (node->name)
    {
    case whilestm:
        whileCount++;
        break;
    case ifstm:
        ifCount++;
        break;
    case breakstm:
        if (whileCount == 0)
        {
            exit(semanticError("break statement not in while statement", node->lineNum));
        }
    case variabledeclaration:
        if (whileCount != 0 || ifCount != 0)
        {
            exit(semanticError("local declaration found in while of if statement", node->lineNum));
        }

    default:
        break;
    }
}

void postGeneral(AST *node)
{
    switch (node->name)
    {
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
void semanticAnalyzer(AST *root)
{
    std::cout << "testpomt1" << std::endl;

    table->openScope(); // predefined

    table->define(SymbolTableEntry("getchar", "integer", table->scope, 0));
    table->define(SymbolTableEntry("halt", "void", table->scope, 0));
    table->define(SymbolTableEntry("printb", "void", {"boolean"}, table->scope, 0));
    table->define(SymbolTableEntry("printc", "void", {"integer"}, table->scope, 0));
    table->define(SymbolTableEntry("printi", "void", {"integer"}, table->scope, 0));
    table->define(SymbolTableEntry("prints", "void", {"string"}, table->scope, 0));
    table->openScope(); // global scope
    prePostOrder(root, &preGlobalDecs, &postGlobalDecs);
    prePostOrder(root, &preIDs, &postIDs);
    prePostOrder(root, &preArith, &postArith);
    prePostOrder(root, &preTypes, &postTypes);
    prePostOrder(root, &preGeneral, &postGeneral);
    table->print();

    /*

      table->openScope();
      table->define(SymbolTableEntry("sym", "type", {"int", "int"}, table->scope, 1));
      SymbolTableEntry *ref = table->lookup("sym");
      table->closeScope();
      ref->print();
      table->openScope();
      if (table->lookup("sym") == nullptr)
      {
          std::cout << "!!!!null!!!!" << std::endl;
      }
      table->define(SymbolTableEntry("sym", "type", table->scope, 7));
      table->closeScope();
      ref->print(); */
}

int semanticError(std::string message, int line)
{
    std::cerr << "Semantic Error: " << message << " on or near line " << line << std::endl;
    return EXIT_FAILURE;
}

int semanticError(std::string message)
{
    std::cerr << "Semantic Error: " << message << std::endl;
    return EXIT_FAILURE;
}
