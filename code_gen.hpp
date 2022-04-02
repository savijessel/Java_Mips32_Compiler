
#ifndef CODE_GEN_HPP
#define CODE_GEN_HPP

#include <vector>
#include <stack>
#include "symbol.hpp"
#include "util.hpp"

// function that begins traversal and code generation
int codeGeneration(AST *root, SymbolTable *symTable);

// first (global) traversal actions
void preGlobPass(AST *node);
void postGlobPass(AST *node);

// second (primary) traversal actions
void preSecondPass(AST *node);
void postSecondPass(AST *node);

#endif