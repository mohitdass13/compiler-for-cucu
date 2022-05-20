%{
#include<stdio.h>

extern FILE* yyin;
extern FILE* yyout;
FILE* yyout2;
int yywrap()
{
return 1;
}
void yyerror(const char * error)
{
printf("ERROR!!!!\n");
}

%}

%union{
	int number;
	char *string;
}

%token  inttoken chartoken iftoken elsetoken whiletoken  oppar clpar semicln plus minus mult DIV comma returnstm assign lessthan greathan and bitor opbr clbr opsqbr clsqbr isequaltoken notequaltoken lessthaneq greathaneq

%token <string> identifier;
%token <number> number ;
%token <string> string ;

%%
program:  vardef 
| vardecl 
| fundecl 
| fundefine 
| vardef program
| vardecl program
| fundecl program
| fundefine program
;
vardef: type identifier assign expression semicln {fprintf(yyout2,"Identifier : %s Assigning : = ",$2);}
;
vardecl: type identifier semicln {fprintf(yyout2,"IDENT:%s",$2);}
;
fundecl: type identifier oppar arguments clpar semicln {fprintf(yyout2,"FUNCTION_DECLARED:%s",$2);}
;
fundefine: type identifier oppar arguments clpar funbody {fprintf(yyout2,"FUNCTION_CALLED:%s",$2);}
;
arguments: type identifier comma arguments {fprintf(yyout2,"IDENT:%s",$2);} | type identifier {fprintf(yyout2,"IDENT:%s",$2);}
| type identifier
|
;
type: inttoken {fprintf(yyout2,"TYPE: INT\n");} 
| chartoken {fprintf(yyout2,"TYPE: CHAR\n");}
;
funbody: opbr stmnts clbr
;
stmnts: stmnts stmnt 
        |stmnt
        ;
stmnt: type identifier assign expression semicln {fprintf(yyout2,"IDENT:%s\n",$2);} 
        | identifier assign expression semicln {fprintf(yyout2,"IDENT:%s\n",$1);}
        | returnstm expression semicln 
        | iftoken oppar expression clpar opbr stmnts clbr {fprintf(yyout2,"If statement : \n");}
        | iftoken oppar expression clpar opbr stmnts clbr elsetoken opbr stmnts clbr {fprintf(yyout2,"If statement : \n");}
        | whiletoken oppar expression clpar opbr stmnts clbr {fprintf(yyout2,"while statement : \n");}
        | expression semicln
        | type identifier semicln {fprintf(yyout2,"Identifier : %s \n", $2);}
        | funcal semicln
        ;

funcal: | identifier oppar funpara clpar {fprintf(yyout2,"Identifier : %s \n", $1);}
;

funpara : expression comma funpara
|expression
|
;

expression: btwexpr 
            | btwexpr assign expression 
;
btwexpr: equalexpr 
         | btwexpr and equalexpr
;
equalexpr : kaexpr
            | equalexpr isequaltoken kaexpr
            | equalexpr notequaltoken kaexpr
;

kaexpr : adexpr
         | kaexpr lessthaneq adexpr
         | kaexpr greathaneq adexpr
         | kaexpr lessthan adexpr
         | kaexpr greathan adexpr

adexpr: prexpr 
        | adexpr plus prexpr
        | adexpr minus prexpr
        | adexpr mult prexpr
        | adexpr DIV prexpr 
;

prexpr: number {fprintf(yyout2,"CONST-%d\n",$1);} 
| identifier{fprintf(yyout2,"ID-%s\n",$1);} 
| string {fprintf(yyout2,"String - %s\n", $1);}
| oppar expression clpar
| funcal
;

%%
int main()
{
yyin=fopen("sample.cu","r");
yyout=fopen("out.txt","w");
yyout2=fopen("parser.txt","w");
yyparse();
}

