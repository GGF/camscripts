#include <stdio.h>
#include <string.h>

#define PCAD2000 2000
#define PCAD4 4
#define PCAD85 85
#define CAM7 7
#define CAM8 8
#define CAM9 9
#define CAM10 10
#define CAM12 12
#define CAM15 15

void usage(){
	printf ("Usage: getpcbtype filename\n");
}
int main(int argc, char* argv[])
{
	char str[1024];
	str[0] = 0;
	int limit = 200;
	int counter = 0;
	FILE *pf;

	if (argc<2) {
		usage();
		return 1;
	} else {
           strcpy(str,"");
           for(int i=1;i<argc;i++) { strcat(str,argv[i]); strcat(str," "); }
	}

	printf("%s\n",str);

		pf = fopen(str,"r");
		if (!pf) {
			printf("Can't open file");
			return 1;
		}

	while (counter < limit) {
		char ch = fgetc (pf);
		str[counter] = ch;
		counter++;
	}
	str[counter]=0;
	_fcloseall ();

	if (strstr(str,"ACCEL_ASCII" )  != NULL )					return PCAD2000;
	if (strstr(str,"II" )		    != NULL )					return PCAD2000;
	if (strstr(str,"VERSION 5." )  != NULL )					return CAM7;
	if (strstr(str,"VERSION 6." )  != NULL )					return CAM7;
	if (strstr(str,"VERSION 7.0" )  != NULL )					return CAM7;
	if (strstr(str,"VERSION 7." )  != NULL )					return CAM8;
	if (strstr(str,"VERSION 8.0" )  != NULL )					return CAM8;
	if (strstr(str,"VERSION 8." )  != NULL )					return CAM9;
	if (strstr(str,"VERSION 9.0" )  != NULL )					return CAM9;
	if (strstr(str,"VERSION 9" )  != NULL )					return CAM10;
	if (strstr(str,"VERSION 10" )  != NULL )					return CAM10;
	if (strstr(str,"VERSION 12" )  != NULL )					return CAM12;
	if (strstr(str,"VERSION 15" )  != NULL )					return CAM15;
	if (strstr(str,"version : 2.09") != NULL )					return PCAD85;
	if (strstr(str,"version : 1.04") != NULL )					return PCAD4;

	return 0;
}

