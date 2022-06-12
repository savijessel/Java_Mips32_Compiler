# Java To Mips32 Compiler
This project is a compiler written in C++ that converts a non-trivial subset of Java to Mips32

Java Subset (J--) Specification  

.clickme { cursor: pointer; background-color: yellow; padding: 0.25em 0.5em 0.25em 0.5em; } <!-- var flags = {}; function expose(id) { if (!(id in flags)) { flags\[id\] = false; } var x = document.getElementById(id); flags\[id\] = !flags\[id\]; x.style.display = flags\[id\] ? "inline" : "none"; } -->

Java Subset (J--) Specification  

==========================================

* * *

Overview
--------


Here's a short list of what `J--` supports:

*   Data types. `int` and `boolean` are supported.
*   Strings. Strings have very limited support. String literals may only be used as arguments to a run-time library routine; you cannot declare a variable with the type “string”.
*   Functions. Functions may take arguments, and must return either int, boolean, or void. Functions may be recursive. You may not have functions nested inside each other.
*   Expressions. The usual operations: `+`, `-`, `*`, `/`, `%`, `<`, `>`, `<=`, `>=`, `=`, `==`, `!=`, `!`, `&&`, `||`, and unary minus. Java precedence and associativity rules apply, but can be modified with the use of parentheses. Logical AND (`&&`) and OR (`||`) are short-circuiting.
*   Statements. `break`, `return`, `if`, `if`\-`else`, and `while`.
*   Strong type checking.

`J--` is such a tiny subset of Java that there's very little difference between it and, say, a similar subset of C or C++. `J--` doesn't even have classes! The major reason that a subset of Java was selected is because it has stricter rules about types – you can't mix integers and boolean values freely. For example, in C/C++ you can write:

    int i;
    ...
    if (i) { ... }

But in Java you'd have to write it as:

    int i;
    ...
    if (i != 0) { ... }

Because then the `if` statement's condition is a boolean expression rather than an integer expression.

Some Examples
-------------

Hello, world:

    howdy() {
            prints("Hello, world!\n");
    }

Fibonacci series (recursive):

    main() {
            int i;
            i = 0;
    
            //  Anything larger than 47 overflows an int..
            //
            while (i <= 47) {
                    prints("fib(");
                    printi(i);
                    prints(") = ");
                    printi(fib(i));
                    prints("\n");
                    i = i + 1;
            }
    }
    
    int fib(int n) {
            if (n == 0) return 0;
            if (n == 1) return 1;
            return fib(n-1) + fib(n-2);
    }

Relationship Between `J--` and Java
-----------------------------------

The following table shows the major `J--` language constructs and how they correspond to those in Java:

`J--` Construct

Java Construct

int

int

boolean

boolean

void

void

global variable

instance variable

function

method

main function

constructor

local variable

local variable

if/else/while/return

if/else/while/return

break

break (with no label allowed)

true

true (not a reserved word)

false

false (not a reserved word)

The rough idea is that you can take a `J--` program, dump it into a Java program template, and it'll be a valid Java program. There are exceptions – for instance, if you use identifiers that are reserved words in Java, then things won't go smoothly.

**If in doubt, run a test example through the `J--` reference compiler, not a Java compiler.**

The “hello, world” example in the last section would correspond to the following Java code:

    public class outer {
            //
            //  Run-time library routines.
            //
            void prints(String s) {
                    System.out.print(s);
            }
    
            class howdy {
                    //
                    //  The J-- program.
                    //
                    howdy() {
                            prints("Hello, world!\n");
                    }
            }
    
            outer() { new howdy(); }
    
            public static void main(String[] args) {
                    new outer();
            }
    }

Lexical Specification
---------------------

In brief, a `J--` lexical analyzer must handle:

*   `//` comments.
*   White space.
*   Identifiers. Must start with an alphabetic character (or underscore); may be followed by any number of alphanumeric characters (or underscores).
*   String literals. Only the character escapes `\b`, `\f`, `\t`, `\r`, `\n`, `\'`, `\"`, `\\` need to be supported.
*   Integer literals in base ten only. Numbers with leading zeroes aren't octal in `J--`, and `J--` doesn't allow underscores in numbers.
*   Reserved words: `true`, `false`, `boolean`, `int`, `void`, `if`, `else`, `while`, `break`, `return`.
*   Operators: `+`, `-`, `*`, `/`, `%`, `<`, `>`, `<=`, `>=`, `=`, `==`, `!=`, `!`, `&&`, `||`.
*   Other things: parentheses `()`, braces `{}`, semicolon `;`, comma `,`.

You don't have to worry about some Java things, like Unicode support (just plain 8-bit ASCII is sufficient), character literals, and other types of comments.

Reading through Chapter 3 of [_The Java Language Specification_](http://docs.oracle.com/javase/specs/jls/se7/html/index.html) is advisable.

Syntactic Specification
-----------------------

The [grammar](#grammar) for `J--` was based on the one given for Java in an older version of [_The Java Language Specification_](http://docs.oracle.com/javase/specs/jls/se7/html/index.html). (It's located in Chapter 18 if you want to read the full version.)

Semantic Specification
----------------------

`J--` has Java semantics, with one notable exception: `J--` has no “definite assignment rule”. (The definite assignment rule is obscure enough that experienced Java programmers may not even realize it exists.)

Some more specific things:

*   Every `J--` program must have a main routine. A main routine looks like a function declaration, but without a return type. A main routine cannot have parameters. You cannot call a main routine.
*   Local variables in functions must be declared in the outermost block. This means you can't declare variables inside `if` statements, for example. Aside from this, variable declarations may be mixed freely with code.
*   Global variables and functions may be declared and used in any order. Local variables must be declared before use.
*   `break` statements must be inside a `while` statement.
*   The last statement _executed_ in a non-void function must be a `return` statement.

This is not an exhaustive list, but gives a feel for the sorts of things your compiler must check.

Run-Time Library
----------------

The `J--` run-time library has five routines usable by `J--` programs. These routines are all in the scope enclosing a `J--` program, meaning that a `J--` program may redefine some or all of them.

Although a `J--` user never sees declarations for these routines, some are shown in the table below to illustrate how they should be called:

Name

Signature

Purpose

`getchar`

int getchar()

Returns an ASCII input character as an integer.

`halt`

void halt()

Halts execution of the program.

`printb`

void printb(boolean b)

Prints a boolean as “true” or “false”.

`printc`

void printc(int c)

Prints an integer as an ASCII character.

`printi`

void printi(int i)

Prints an integer.

`prints`

void prints(string s)

Prints a string. This is the only context where strings are allowed in `J--`.

Appendix: `J--` Grammar
-----------------------

    start           : /* empty */
                    | globaldeclarations
                    ;
    
    literal         : NUMBER
                    | STRING
                    | TRUE
                    | FALSE
                    ;
    
    type            : BOOLEAN
                    | INT
                    ;
    
    globaldeclarations      : globaldeclaration
                            | globaldeclarations globaldeclaration
                            ;
    
    globaldeclaration       : variabledeclaration
                            | functiondeclaration
                            | mainfunctiondeclaration
                            ;
    
    variabledeclaration     : type identifier ';'
                            ;
    
    identifier              : ID
                            ;
    
    functiondeclaration     : functionheader block
                            ;
    
    functionheader          : type functiondeclarator
                            | VOID functiondeclarator
                            ;
    
    functiondeclarator      : identifier '(' formalparameterlist ')'
                            | identifier '(' ')'
                            ;
    
    formalparameterlist     : formalparameter
                            | formalparameterlist ',' formalparameter
                            ;
    
    formalparameter         : type identifier
                            ;
    
    mainfunctiondeclaration : mainfunctiondeclarator block
                            ;
    
    mainfunctiondeclarator  : identifier '(' ')'
                            ;
    
    block                   : '{' blockstatements '}'
                            | '{' '}'
                            ;
    
    blockstatements         : blockstatement
                            | blockstatements blockstatement
                            ;
    
    blockstatement          : variabledeclaration
                            | statement
                            ;
    
    statement               : block
                            | ';'
                            | statementexpression ';'
                            | BREAK ';'
                            | RETURN expression ';'
                            | RETURN ';'
                            | IF '(' expression ')' statement
                            | IF '(' expression ')' statement ELSE statement
                            | WHILE '(' expression ')' statement
                            ;
    
    statementexpression     : assignment
                            | functioninvocation
                            ;
    
    primary                 : literal
                            | '(' expression ')'
                            | functioninvocation
                            ;
    
    argumentlist            : expression
                            | argumentlist ',' expression
                            ;
    
    functioninvocation      : identifier '(' argumentlist ')'
                            | identifier '(' ')'
                            ;
    
    postfixexpression       : primary
                            | identifier
                            ;
    
    unaryexpression         : '-' unaryexpression
                            | '!' unaryexpression
                            | postfixexpression
                            ;
    
    multiplicativeexpression: unaryexpression
                            | multiplicativeexpression '*' unaryexpression
                            | multiplicativeexpression '/' unaryexpression
                            | multiplicativeexpression '% ' unaryexpression
                            ;
    
    additiveexpression      : multiplicativeexpression
                            | additiveexpression '+' multiplicativeexpression
                            | additiveexpression '-' multiplicativeexpression
                            ;
    
    relationalexpression    : additiveexpression
                            | relationalexpression '<' additiveexpression
                            | relationalexpression '>' additiveexpression
                            | relationalexpression LE additiveexpression
                            | relationalexpression GE additiveexpression
                            ;
    
    equalityexpression      : relationalexpression
                            | equalityexpression EQ relationalexpression
                            | equalityexpression NE relationalexpression
                            ;
    
    conditionalandexpression: equalityexpression
                            | conditionalandexpression AND equalityexpression
                            ;
    
    conditionalorexpression : conditionalandexpression
                            | conditionalorexpression OR conditionalandexpression
                            ;
    
    assignmentexpression    : conditionalorexpression
                            | assignment
                            ;
    
    assignment              : identifier '=' assignmentexpression
                            ;
    
    expression              : assignmentexpression
                            ;

* * *

John Aycock, 17 March 2022

### Dependencies
This compiler utilizes Flex and Bison as tools for scanning and parsing respectively. Please ensure that these are installed on your machine. Clang++ and C++ 14 are also dependencies required for this project. You may modify some of the dependicies in the Makefile included in the root directory, but no guarantees are made about whether the program will still run or behave as intended. 

### Build and Run Instructions

1. Please clone/copy this repository to your testing environment
2. Using a unix shell, please navigate to the top level directory of this repository
3. Type 'make' into the shell and press enter. <br />
4. After the compilation has finished, please run the compiler by running the following command: <br />
    [YOUR PATH HERE]/main    [YOUR TEXT FILE PATH HERE]

    For example, if you are in the same directory as the compiler and text file, you would run the following command: <br />
    ./main test.txt <br />

    Note that test.txt will be replaced by the name of your test file.

5. If the test file contains correct input, you should see MIPS assembly code outputted <br />
   

   If the test file contains semantic errors, syntax errors, or lexical errors, you will see a warning or error message. 

6. Note that if you want to delete the files produced by the make command, simple run the following command: <br />
    make clean

#### Please note that a combination of test inputs written in the Java subset and the respective Mips32 outputs are located in the FINAL_PROJECT_OUTPUT directory

