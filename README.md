# CPSC 411 Milestone 2

Savipal Jessel, UCID: 30039257, savipal.jessel@ucalgary.ca

### Build and Run Instructions

1. Please clone/copy this repository to your testing environment
2. Using a unix shell, please navigate to the top level directory of this repository
3. Type 'make' into the shell and press enter. <br />
4. After the compilation has finished, please run the parser by running the following command: <br />
    [YOUR PATH HERE]/parser    [YOUR TEXT FILE PATH HERE]

    For example, if you are in the same directory as the scanner and text file, you would run the following command: <br />
    ./parser test.txt <br />

    Note that test.txt will be replaced by the name of your test file.

5. If the test file contains syntaxically correct input, you should see output formatted similarly to the following: <br />
    Program: { 'example' } <br />
    main function declaration { line: # } <br />
        main function declarator { line: # } <br />
            identifier { Attr: 'example', line: # } <br />

   If the test file contains syntax or lexical, you may see a warning or error message. 

6. Note that if you want to delete the files produced by the make command, simple run the following command: <br />
    make clean



