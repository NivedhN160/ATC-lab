#include <stdio.h>
#include <string.h>
#include <ctype.h>

int isKeyword(char *str) {
    char *keywords[] = {"int","float","char","double","if","else","while","for","return","void"};
    for(int i=0;i<10;i++) {
        if(strcmp(str,keywords[i])==0)
            return 1;
    }
    return 0;
}

int isOperator(char ch) {
    return (ch=='+'||ch=='-'||ch=='*'||ch=='/'||ch=='='||ch=='<'||ch=='>');
}

int main() {
    char str[100], token[50];
    int i=0,j=0;

    printf("Enter code:\n");
    fgets(str,sizeof(str),stdin);

    while(str[i] != '\0') {

        if(isalnum(str[i])) {
            token[j++] = str[i];
        } else {
            if(j!=0) {
                token[j] = '\0';
                if(isKeyword(token))
                    printf("Keyword: %s\n", token);
                else if(isdigit(token[0]))
                    printf("Number: %s\n", token);
                else
                    printf("Identifier: %s\n", token);
                j=0;
            }

            if(isOperator(str[i])) {
                printf("Operator: %c\n", str[i]);
            }
        }
        i++;
    }

    return 0;
}
