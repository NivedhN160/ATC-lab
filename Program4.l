%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int valid(char *s)
{
    int i;
    if(!(isalpha(s[0]) || s[0]=='_'))
        return 0;
    for(i=1; s[i]!='\0'; i++)
    {
        if(!(isalnum(s[i]) || s[i]=='_'))
            return 0;
    }
    return 1;
}
%}

%%
.*\n {
    yytext[strlen(yytext)-1] = '\0';
    if(valid(yytext))
        printf("Valid Identifier\n");
    else
        printf("Invalid Identifier\n");
}
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