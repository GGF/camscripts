// fork.c : for windows start arguments in new process (for close bat file without waiting)
//

#include <stdio.h>
#include <process.h>
#include <errno.h>
#include <string.h>


int main(int argc, char* argv[])
{
	char str[3000];
	char progname[512];
	int i;

	if ( argc <2 ) return 1;

	strcpy(str,"");
	strcpy(progname,"\"");
	strcat(progname,argv[1]);
	strcat(progname,"\"");
	for ( i=0; i<argc; i++) {
        printf("argv[%i]=%s\n",i,argv[i]);
        if (i<2) continue;
        strcat(str,"\"");
        strcat(str,argv[i]);
        strcat(str,"\" ");
        printf("%s\n",str);
    }

	_execl(argv[1],progname,str,NULL);

	return 0;
}

