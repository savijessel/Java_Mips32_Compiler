# CPSC 411 Milestone 1

Savipal Jessel, UCID: 30039257, savipal.jessel@ucalgary.ca

### Build and Run Instructions

1. Please clone/copy this repository to your testing environment
2. Using a unix shell, please navigate to the top level directory of this repository
3. Type 'make' into the shell and press enter. You should see the following output: <br />
    flex --c++ scanner.l <br />
    g++ -std=c++14 -o scanner lex.yy.cc main.cpp <br />

4. Run the scanner by running the following command: <br />
    [YOUR PATH HERE]/scanner    [YOUR TEXT FILE PATH HERE]

    For example, if you are in the same directory as the scanner and text file, you would run the following command: <br />
    ./scanner test.txt <br />

    Note that test.txt will be replaced by the name of your test file.

5. If the test file contains valid input, you should see output formatted similarly to the following: <br />
    line: line_number_placeholder | token: token_placeholder | Lexeme: lexeme_placeholder

   If the test file contains invalid input, you may see an error or warning message. Note that the scanner will output an error
   if at least 10 warning messages are sent out. 

6. Note that if you want to delete the files produced by the make command, simple run the following command: <br />
    make clean



