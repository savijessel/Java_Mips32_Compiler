#include "semantic.hpp"

SymbolTable *table = new SymbolTable();
bool declAcceptType = false;
bool declAcceptID = false;
bool decl = false;
bool declRet = false;
bool needsRet = false;
bool acceptIDs = false;
bool declAcceptFormals = false;
bool acceptID = false;
bool acceptCallID = false;
bool acceptArgs = false;
bool stmtOp = false;
int mainCount = 0;
SymbolTableEntry *tempSymbolRef = new SymbolTableEntry();
SymbolTableEntry *tempCheckSymbolRef = new SymbolTableEntry();
std::vector<std::string> assignOp;
std::vector<std::string> binaryOp;
std::string funcRet;
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
            std::cout << "non declaration" << std::endl;
            std::cout << "Line Number: " << node->lineNum << std::endl;
            node->symbolRef->print();
            std::cout << "end" << std::endl;
        }

        if (table->scope == 3 && acceptID)
        {

            if (table->lookup(node->attribute) != nullptr)
            {
                node->symbolRef = table->lookup(node->attribute);
                std::cout << "non declaration" << std::endl;
                std::cout << "Line Number: " << node->lineNum << std::endl;
                node->symbolRef->print();
                std::cout << "end" << std::endl;
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
        stmtOp = true;
        declRet = true;
        break;

    case binop:
        binaryOp.clear();
        argCount = 0;
        acceptIDs = true;
        break;
    case unop:
        argCount = 0;
        acceptIDs = true;
        break;
    case identifier:

        if (decl)
        {
            funcRet = node->symbolRef->type;
            if (funcRet != "void")
                needsRet = true;
            decl = false;
        }

        if (declRet) // *** IMPORTANT *** INVESTIGATE BEHAVIOR ON EDGE CASES (X=Y=Z)
        {
            std::cout << "ret: " << funcRet << std::endl;
            std::cout << "nodetype: " << node->symbolRef->type << node->lineNum << std::endl;
            node->symbolRef->print();
            if (funcRet == "void")
                exit(semanticError("void function returns a value", node->lineNum));

            if (funcRet != node->symbolRef->type)
                exit(semanticError("returned value has the wrong type", node->lineNum));
            declRet = false;
            needsRet = false;
        }

        if ((acceptID) && !acceptCallID && !acceptArgs)
        {
            assignOp.push_back(node->symbolRef->type);
        }

        if (acceptIDs)
        {
            binaryOp.push_back(node->symbolRef->type);
        }

        if (acceptCallID)
        {

            tempCheckSymbolRef->clear();
            std::cout << "node" << std::endl;
            if (assignOp.empty() && node->symbolRef->type == "void")
                assignOp.push_back(node->symbolRef->type);
            node->symbolRef->print();
            tempCheckSymbolRef->paramTypes = node->symbolRef->paramTypes;
            tempCheckSymbolRef->type = node->symbolRef->type;
            // binaryOp.push_back(node->symbolRef->type);
            acceptCallID = false;
        }

        if (acceptArgs && !acceptIDs)
        {
            argCount++;
            tempSymbolRef->paramTypes.push_back(node->symbolRef->type);
        }

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
            exit(semanticError("non-void function missing return satement", node->lineNum));
        break;
    case assignment:
        if (assignOp.size() == 2)
        {
            if (assignOp[0] != assignOp[1])
                exit(semanticError("mismatched types for assignment", node->lineNum));
        }

        acceptID = false;
        break;

    case binop:
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
        }
        break;
        stmtOp = false;
    }
    case unop:
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
    }

    case argumentlist:
        acceptArgs = false;
        break;

    case functioncall:
        tempCheckSymbolRef->print();
        tempSymbolRef->print();
        if (tempSymbolRef->paramTypes.size() != tempCheckSymbolRef->paramTypes.size())
            exit(semanticError("Incorrect number of arguments", node->lineNum));
        if (tempSymbolRef->paramTypes != tempCheckSymbolRef->paramTypes)
            exit(semanticError("Incorrect argument types", node->lineNum));
        if (assignOp.back() != tempCheckSymbolRef->type)
            exit(semanticError("Mismatched return type", node->lineNum));

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
    prePostOrder(root, &preIDs, &postIDs);
    prePostOrder(root, &preTypes, &postTypes);
    //    table->print();
    /*   std::cout << "table scope:" << table->scope << std::endl;

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
