
#ifndef SEMANTIC_HPP
#define SEMANTIC_HPP

#include <iostream>
#include <vector>
#include <unordered_map>
#include "symbol.hpp"
#include "util.hpp"

// manages predefined/global scopes and runs AST traversals
int semanticAnalyzer(AST *root, SymbolTable *symTable);

// action callbacks for AST traversals
void preGlobalDecs(AST *node);
void postGlobalDecs(AST *node);
void preIDs(AST *node);
void postIDs(AST *node);
void preTypes(AST *node);
void postTypes(AST *node);
void preGeneral(AST *node);
void postGeneral(AST *node);

// Error output functions
int semanticError(std::string message, int line);
int semanticError(std::string message);

#endif