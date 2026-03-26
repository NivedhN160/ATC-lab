%{
#include "y.tab.h"
%}

%%
"if"     return IF;
"else"   return ELSE;
[a-zA-Z]+ return ID;
[0-9]+    return NUM;
"("       return '(';
")"       return ')';
";"       return ';';
[ \t\n]   ;
.         return yytext[0];
%%