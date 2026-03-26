%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
int yylex();
int yyerror();
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%start S

%%
S : E { printf("Result = %d\n", $1); }
  ;

E : E '+' E { $$ = $1 + $3; }
  | E '-' E { $$ = $1 - $3; }
  | E '*' E { $$ = $1 * $3; }
  | E '/' E { $$ = $1 / $3; }
  | '(' E ')' { $$ = $2; }
  | NUMBER { $$ = $1; }
  ;
%%

int yylex()
{
    int c;

    while((c = getchar()) == ' ' || c == '\t');

    if(isdigit(c)) {
        ungetc(c, stdin);
        scanf("%d", &yylval);
        return NUMBER;
    }

    if(c == '\n')
        return 0;

    return c;
}

int main()
{
    printf("Enter Expression: ");
    yyparse();
    return 0;
}

int yyerror()
{
    printf("Invalid Expression\n");
    return 0;
}