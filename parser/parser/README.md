# COOL Compiler - Parser Phase B #
> Group 5, Ganesh Vernekar (CS15BTECH11018), Sukrut Rao (CS15BTECH11036)

The project implements phase B of the COOL parser. An AST is generated.

### The Code and Design

* A set of actions have been added to every grammar rule of the COOL grammar.
* These actions use classes and functions defined in AST.java.
* They prepare the structure of each node of the AST and pass the properties of the nodes to it.
* For a syntactically correct program, the code outputs the corresponding AST.
* In the input COOL program, the parser matches the constructs to a grammar rule, and a node is created out of it and added to the AST.
* Further details on different parts of the code can be found in the comments in the .g4 file.

### The Test Cases

* Test cases have been provided to verify each of the actions of each grammar rule. This is done by generating the corresponding AST for each rule.
* There are 6 specific test cases provided, from test1.cl to test6.cl.
* Each of these test cases verifies a set of grammar rules. Inside the test case, as comments, it has been specified which rules it verifies, and which lines in the test case verify the particular rule. Verification of a rule is done in correspondence to the AST that is generated, i.e., the structure of the AST output can be checked to ensure it matches with the specification of the COOL grammar.
* In addition, a set of non-trivial COOL programs are provided for further verification.
* As the above dummy test cases and working COOL programs comprehensively and exhaustively cover all the grammar rules and hence the corresponding AST node structures, it can be reasonably expected that the code is robust and correct.
