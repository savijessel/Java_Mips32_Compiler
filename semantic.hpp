#include <iostream>
#include <vector>
#include <functional>
#include "ast.hpp"
#include "symbol.hpp"
#include <unordered_map>

#ifndef SEMANTIC_HPP
#define SEMANTIC_HPP

// manages predefined/global scopes and runs AST traversals
int semanticAnalyzer(AST *root);

// action callbacks for AST traversals
void preGlobalDecs(AST *node);
void postGlobalDecs(AST *node);
void preIDs(AST *node);
void postIDs(AST *node);
void preArith(AST *node);
void postArith(AST *node);
void preTypes(AST *node);
void postTypes(AST *node);
void preGeneral(AST *node);
void postGeneral(AST *node);

// AST traversals
void postOrder(AST *node, std::function<void(AST *)> action);
void preOrder(AST *node, std::function<void(AST *)> action);
void prePostOrder(AST *node, std::function<void(AST *)> preAction, std::function<void(AST *)> postAction);

// Error output functions
int semanticError(std::string message, int line);
int semanticError(std::string message);

#endif