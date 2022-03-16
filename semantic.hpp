#include <iostream>
#include <vector>
#include <functional>
#include "ast.hpp"
#include "symbol.hpp"

#ifndef SEMANTIC_HPP
#define SEMANTIC_HPP

void semanticAnalyzer(AST *root);

void preGlobalDecs(AST *node);
void postGlobalDecs(AST *node);
void preIDs(AST *node);
void postIDs(AST *node);
void preTypes(AST *node);
void postTypes(AST *node);

void postOrder(AST *node, std::function<void(AST *)> action);
void preOrder(AST *node, std::function<void(AST *)> action);
void prePostOrder(AST *node, std::function<void(AST *)> preAction, std::function<void(AST *)> postAction);

int semanticError(std::string message, int line);
int semanticError(std::string message);

#endif