# Java To Mips32 Compiler
This project is a compiler written in C++ that converts a non-trivial subset of Java to Mips32

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

