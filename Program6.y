%{
#include <stdio.h>
#include <ctype.h>

int yylex();
int yyerror();
%}

%token IF ELSE ID

%start S

%%
S : IF '(' E ')' S
  | IF '(' E ')' S ELSE S
  | ID ';'
  ;

E : ID
  ;
%%

int yylex()
{
    int c;

    while((c = getchar()) == ' ' || c == '\t');

    if(c == 'i') return IF;
    if(c == 'e') return ELSE;
    if(isalpha(c)) return ID;

    return c;
}

int main()
{
    printf("Enter statement:\n");
    yyparse();
    printf("Parsing Done\n");
    return 0;
}

int yyerror()
{
    printf("Error in statement\n");
    return 0;
}