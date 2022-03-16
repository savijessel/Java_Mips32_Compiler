#include "semantic.hpp"

SymbolTable *table = new SymbolTable();
bool acceptGlobalRet = false;
bool acceptGlobalID = false;
bool acceptGlobalFormals = false;
int mainCount = 0;
SymbolTableEntry *tempSymbolRef = new SymbolTableEntry();

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
            acceptGlobalID = true;
        }
        else
        {
            acceptGlobalRet = true;
            acceptGlobalID = true;
        }
        break;

    case variabledeclaration:
        tempSymbolRef->clear();
        if (table->scope == 2)
        {
            acceptGlobalRet = true;
            acceptGlobalID = true;
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
        if (acceptGlobalRet)
        {
            tempSymbolRef->type = node->nodeType;
            acceptGlobalRet = false;
        }

        if (acceptGlobalFormals)
        {
            table->lookup(tempSymbolRef->symbol)->paramTypes.push_back(node->nodeType);
        }
        break;

    case identifier:
        if (acceptGlobalID)
        {
            tempSymbolRef->symbol = node->nodeType;
            tempSymbolRef->scope = table->scope;
            tempSymbolRef->lineNum = node->lineNum;
            table->define(*tempSymbolRef);
            acceptGlobalID = false;
        }

        break;

    case formalparameterlist:
        acceptGlobalFormals = true;
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
        acceptGlobalFormals = false;
        table->openScope();
        break;
    case functiondeclaration:
        table->closeScope();
        break;
    default:
        break;
    }
}

void globalDecs(AST *node)
{
    std::cout << node->name << std::endl;
    switch (node->name)
    {

    case functiondeclaration:
        std::cout << "hello" << std::endl;
        break;
    default:
        break;
    }
}

void semanticAnalyzer(AST *root)
{

    table->openScope(); // predefined
    table->openScope(); // global scope
    prePostOrder(root, &preGlobalDecs, &postGlobalDecs);
    table->print();
    // preOrder(root, &globalDecs);
    /*
   table->openScope();
   table->define(SymbolTableEntry("sym", "type", table->scope, 1));
   table->openScope();
   table->define(SymbolTableEntry("sym", "type", table->scope, 1));
   std::cout << "testing... scope: " << table->lookup("sym")->scope << std::endl; */
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
