%{
#include <stdio.h>

int yylex();
int yyerror();
%}

%token IF ELSE ID NUM

%start S

%%
S : IF '(' E ')' S
  | IF '(' E ')' S ELSE S
  | ID '=' E ';'
  ;

E : ID
  | NUM
  ;
%%

int main()
{
    printf("Enter statement:\n");
    yyparse();
    printf("Valid Statement\n");
    return 0;
}

int yyerror()
{
    printf("Invalid Statement\n");
    return 0;
}