#include <stdio.h>

unsigned int RUNPP_REG_ERR = 0;

unsigned int hash(unsigned int a, unsigned int b, unsigned int code);

void printbin(unsigned int n) {
    int k;
    for (int i = 31; i >= 0; i--){
       k = n >> i;
       if (k & 1)
           printf("1");
       else
           printf("0");
	if(i%4 == 0)
	    printf(" ");
    }
    printf("\n");
}


int main() {
    unsigned int v1, v2, code, r;
    printf("Vrednost prvog broja: ");
    scanf("%d", &v1);
    
    printf("Binarno:  ");
    printbin(v1);

    printf("Vrednost drugog broja: ");
    scanf("%d", &v2);
    
    printf("Binarno:  ");
    printbin(v2);

    printf("Unesite code: ");
    scanf("%d", &code);
     
    r = hash(v1, v2, code);
    printf("Rezultat: ");

    printbin(r);
    printf("\n");
    
    #ifdef LEVEL42
    printf("\nRUNPP_REG_ERR:%d\n",RUNPP_REG_ERR);
    #endif
    
    return 0;
}

