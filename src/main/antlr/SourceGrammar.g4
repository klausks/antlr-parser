grammar SourceGrammar;

T_FLOAT : 'float' ;
T_INT : 'int' ;
T_CHAR : 'char' ;

COMMA : ',' ;
SEMI : ';' ;
LBRACK : '[' ;
RBRACK : ']' ;

INT : [0-9]+ ;
ID: [a-zA-Z_][a-zA-Z_0-9]* ;
ARRAY: LBRACK INT+ RBRACK ;
WS: [ \t\n\r\f]+ -> skip ;

program: declaration* EOF ;

type : T_FLOAT | T_INT | T_CHAR ;

declaration : type declaratorList SEMI
            | T_CHAR arr_declarator SEMI
            ;

declaratorList : ID (COMMA ID)* ;

arr_declarator : ID ARRAY* ;

//program
//    : stat EOF
//    | def EOF
//    ;
//
//stat: ID '=' expr ';'
//    | expr ';'
//    ;
//
//def : ID '(' ID (',' ID)* ')' '{' stat* '}' ;
//
//expr: ID
//    | INT
//    | func
//    | 'not' expr
//    | expr 'and' expr
//    | expr 'or' expr
//    ;
//
//func : ID '(' expr (',' expr)* ')' ;

