
#ifndef UTIL_HPP
#define UTIL_HPP

#include <functional>
#include <iomanip>
#include <string>
#include <iostream>
#include "ast.hpp"

// enum to represent different print elements
enum printHelper
{
    tab,
    newline,
    data,
    globalword,
    maindec,
    text,
    bytearr,
    align,
    truestr,
    falsestr,
    sp,
    t0,
    t1,
    t2,
    t3,
    t4,
    t5,
    t6,
    t7,
    zeroreg,

};

std::string reserveReg();
std::string reserveSReg();
void freeReg(std::string reg);
void printRegManager();
std::vector<std::string> getReserved();
void saveRegisters(std::vector<std::string> regs);
void loadRegisters(std::vector<std::string> regs);
void genArithInst(std::string op, std::string dest, std::string source1, std::string source2);
void genArithInst(std::string op, std::string source1, std::string source2);
void genSingleInst(std::string op, std::string dest);
void genDoubleInst(std::string op, std::string dest, std::string source);
void genMemInst(std::string op, std::string dest, std::string source);
void genMemInst(std::string op, std::string dest, int source);
void genMemInst(std::string op, std::string reg, std::string source, std::string offset);
void genPopStack(std::string reg, int offset);
void genPushStackVal(std::string value, int offset);
void genPushStack(std::string reg, int offset);
void genLoadID(AST *node, std::string reg);
void genGlobalID(std::string value, std::string label);
void genStoreID(AST *node, std::string reg);
void genHalt();
void genArgs(AST *node);
void genPrints(AST *node);
void genPrinti(AST *node);
void genPrintc(AST *node);
void genPrintb(AST *node);
void genGetChar(AST *node);
void genByteArr(std::string str);
void genRetError(std::string str);
void labelBreak(AST *node);
int genError(std::string message);

// AST traversals
void postOrder(AST *node, std::function<void(AST *)> action);
void preOrder(AST *node, std::function<void(AST *)> action);
void prePostOrder(AST *node, std::function<void(AST *)> preAction, std::function<void(AST *)> postAction);

std::ostream &operator<<(std::ostream &out, const printHelper value);

#endif