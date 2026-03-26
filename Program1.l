%{
#include <stdio.h>
#include <string.h>
%}

digit      [0-9]
letter     [a-zA-Z]
id         {letter}({letter}|{digit})*
number     {digit}+(\.{digit}+)?

%%
"int"|"float"|"char"|"double"|"if"|"else"|"while"|"for"|"return" { printf("Keyword: %s\n", yytext); }
{id}        { printf("Identifier: %s\n", yytext); }
{number}    { printf("Number: %s\n", yytext); }
"+"|"-"|"*"|"/"|"="|"=="|"<"|">"|"<="|">="|"!=" { printf("Operator: %s\n", yytext); }
[ \t\n]+    ;
.           ;
%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}