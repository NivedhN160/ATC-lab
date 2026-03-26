%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror();
int temp = 0;

char* newtemp()
{
    char *t = (char*)malloc(5);
    sprintf(t, "t%d", temp++);
    return t;
}
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%start S

%%
S : E { printf("Final Result in %s\n", $1); }
  ;

E : E '+' E {
        char* t = newtemp();
        printf("%s = %s + %s\n", t, $1, $3);
        $$ = t;
    }
  | E '*' E {
        char* t = newtemp();
        printf("%s = %s * %s\n", t, $1, $3);
        $$ = t;
    }
  | NUMBER {
        char* t = newtemp();
        printf("%s = %d\n", t, $1);
        $$ = t;
    }
  ;
%%

int yylex()
{
    int c;
    while((c=getchar())==' ');

    if(isdigit(c))
    {
        ungetc(c, stdin);
        scanf("%d", &yylval);
        return NUMBER;
    }
    return c;
}

int main()
{
    printf("Enter Expression:\n");
    yyparse();
    return 0;
}

int yyerror()
{
    printf("Error\n");
    return 0;
}