#include <stdio.h>
#include <string.h>

int main()
{
    char a[10], b[10], op, expr[20];
    char prev[20] = "";

    while(1)
    {
        printf("Enter expression (a=b+c) or exit:\n");
        scanf("%s", expr);

        if(strcmp(expr, "exit") == 0)
            break;

        sscanf(expr, "%[^=]=%[^+-*/]%c%s", a, b, &op, expr);

        char current[20];
        sprintf(current, "%s%c%s", b, op, expr);

        if(strcmp(prev, current) == 0)
        {
            printf("Common Subexpression Eliminated\n");
        }
        else
        {
            printf("Compute: %s = %s\n", a, current);
            strcpy(prev, current);
        }
    }
}