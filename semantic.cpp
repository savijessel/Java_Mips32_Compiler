#include "semantic.hpp"

SymbolTable *table = new SymbolTable();
bool declAcceptType = false;
bool declAcceptID = false;
bool acceptIDs = false;
bool declAcceptFormals = false;
bool acceptID = false;
bool acceptArgs = false;
int mainCount = 0;
SymbolTableEntry *tempSymbolRef = new SymbolTableEntry();
std::vector<std::string> assignOp;
int argCount = 0;
std::unordered_multimap<std::string, std::vector<std::string>> opTable({

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

void preGlobalDecs(AST *node)
{
    switch (node->name)
    {
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

    case variabledeclaration:
        tempSymbolRef->clear();
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
            declAcceptType = false;
        }

        if (declAcceptFormals)
        {
            table->lookup(tempSymbolRef->symbol)->paramTypes.push_back(node->nodeType);
        }
        break;

    case identifier:
        if (declAcceptID)
        {
            tempSymbolRef->symbol = node->attribute;
            tempSymbolRef->scope = table->scope;
            tempSymbolRef->lineNum = node->lineNum;
            table->define(*tempSymbolRef);
            node->symbolRef = table->lookup(tempSymbolRef->symbol);
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

    case identifier:
        if (node->attribute != "main")
            break;
    default:
        break;
    }
}

void preTypes(AST *node)
{

    switch (node->name)
    {

    case assignment:
        assignOp.clear();
        acceptID = true;
        break;

    case binop:
        acceptIDs = true;
        break;
    case identifier:
        if (acceptID || acceptIDs)
        {
            assignOp.push_back(node->symbolRef->type);
            acceptID = false;
        }

    default:
        break;
    }
}

void postTypes(AST *node)
{

    switch (node->name)
    {
    case assignment:
        break;

    case binop:
    {

        bool error = true;
        auto its = opTable.equal_range(node->nodeType);
        for (auto it = its.first; it != its.second; it++)
        {
            for (auto s : it->second)
                std::cout << "hash: " << s << std::endl;
            for (auto s : assignOp)
                std::cout << "assignOp: " << s << std::endl;
            if (it->second == assignOp)
                error = false;
        }
        acceptIDs = false;
        assignOp.clear();
        if (error)
            exit(semanticError("mismatched types for '" + node->nodeType + "' operation", node->lineNum));
    }
    break;

    default:
        break;
    }
}

void semanticAnalyzer(AST *root)
{

    table->openScope(); // predefined
    table->define(SymbolTableEntry("func", "lol", table->scope, 0));
    table->openScope(); // global scope
    prePostOrder(root, &preGlobalDecs, &postGlobalDecs);
    prePostOrder(root, &preIDs, &postIDs);
    prePostOrder(root, &preTypes, &postTypes);
    table->print();
    std::cout << "table scope:" << table->scope << std::endl;

    /* table->openScope();
    table->define(SymbolTableEntry("sym", "type", table->scope, 1));
    SymbolTableEntry *ref = table->lookup("sym");
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
