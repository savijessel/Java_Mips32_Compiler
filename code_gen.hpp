
#ifndef CODE_GEN_HPP
#define CODE_GEN_HPP

#include <vector>
#include <stack>
#include "symbol.hpp"
#include "util.hpp"

int codeGeneration(AST *root, SymbolTable *symTable);

void preGlobPass(AST *node);
void postGlobPass(AST *node);
void preSecondPass(AST *node);
void postSecondPass(AST *node);

#endif