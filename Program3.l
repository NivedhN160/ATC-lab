%{
#include <stdio.h>
int vowels = 0, consonants = 0;
%}

%%
[aeiouAEIOU]      { vowels++; }
[a-zA-Z]          { consonants++; }
.|\n              ;
%%

int main()
{
    yylex();
    printf("Vowels: %d\nConsonants: %d\n", vowels, consonants);
    return 0;
}

int yywrap()
{
    return 1;
}