%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror();

typedef struct node {
    char op;
    struct node *left, *right;
} node;

node* newnode(char op, node* l, node* r)
{
    node* n = (node*)malloc(sizeof(node));
    n->op = op;
    n->left = l;
    n->right = r;
    return n;
}

void inorder(node* t)
{
    if(t)
    {
        inorder(t->left);
        printf("%c ", t->op);
        inorder(t->right);
    }
}
%}

%token ID

%left '+' '-'
%left '*' '/'

%start S

%%
S : E { printf("AST (Inorder): "); inorder($1); printf("\n"); }
  ;

E : E '+' E { $$ = newnode('+', $1, $3); }
  | E '-' E { $$ = newnode('-', $1, $3); }
  | E '*' E { $$ = newnode('*', $1, $3); }
  | E '/' E { $$ = newnode('/', $1, $3); }
  | ID      { $$ = newnode('i', NULL, NULL); }
  ;
%%

int yylex()
{
    int c;
    while((c=getchar())==' '||c=='\t');
    if(isalpha(c)) return ID;
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
    printf("Error\n");
    return 0;
}