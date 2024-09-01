grammar ExprParser;

FLOAT : 'float' ;
INT : 'int' ;
CHAR : 'char' ;

COMMA : ',' ;
SEMI : ';' ;
LBRACK : '{' ;
RBRACK : ']' ;

INT : [0-9]+ ;
ID: [a-zA-Z_][a-zA-Z_0-9]* ;
ARRAY: LBRACK INT+ RBRACK
WS: [ \t\n\r\f]+ -> skip ;

program
    : stat EOF
    | def EOF
    ;

stat: ID '=' expr ';'
    | expr ';'
    ;

def : ID '(' ID (',' ID)* ')' '{' stat* '}' ;

expr: ID
    | INT
    | func
    | 'not' expr
    | expr 'and' expr
    | expr 'or' expr
    ;

func : ID '(' expr (',' expr)* ')' ;

type : FLOAT | INT | CHAR ;
type_decl : type ID SEMI ;