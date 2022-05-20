%{
#include "cucu.tab.h"
int yylex();
//[=][=]|[!][=]|[<]|[>]|[<][=][\|]|[>][=]      {fprintf(yyout,"COMPARATOR: %s\n",yytext); return(reloprtr);}
%}
%%
int {fprintf(yyout,"TYPE : %s\n",yytext); return (inttoken);}
char[ ][*]  {fprintf(yyout,"TYPE : %s\n",yytext); return (chartoken);}
if {fprintf(yyout,"KEYWORD : %s\n",yytext); return (iftoken);}
else {fprintf(yyout,"KEYWORD : %s\n",yytext); return (elsetoken);}
while {fprintf(yyout,"KEYWORD : %s\n",yytext); return(whiletoken);}
[0-9]+      {yylval.number=atoi(yytext); fprintf(yyout,"NUM : %s\n",yytext); return(number);}
== {fprintf(yyout,"EQUAL : %s\n",yytext); return(isequaltoken);}
!= {fprintf(yyout,"NOT EQUAL : %s\n",yytext); return(notequaltoken);}
[(] {fprintf(yyout,"OP_PAREN : %s\n",yytext); return(oppar);}
[)] {fprintf(yyout,"CL_PAREN : %s\n",yytext); return(clpar);}
[;] {fprintf(yyout,"SEMICOLON : %s\n",yytext); return(semicln);}
[+]    {fprintf(yyout,"PLUS : %s\n",yytext); return(plus);}
[-]      {fprintf(yyout,"MINUS : %s\n",yytext); return(minus);}
[*]         {fprintf(yyout,"ASTERISK : %s\n",yytext); return(mult);}
[\/]      {fprintf(yyout,"DIV : %s\n",yytext); return(DIV);}
[,]      {fprintf(yyout,"COMMA : %s\n",yytext); return(comma);}
return        {fprintf(yyout,"RETURN_STMT : %s\n",yytext); return(returnstm);}
[a-z][a-zA-Z0-9]*[\_]*  {yylval.string=strdup(yytext); fprintf(yyout,"ID : %s\n",yytext); return(identifier);}
[>][=]     {fprintf(yyout,"Great_THAN EQ:%s",yytext);return(greathaneq);}
[<][=]  {fprintf(yyout,"LESS_THAN EQ:%s",yytext);return(lessthaneq);}
[=]	{fprintf(yyout,"ASSIGN:%s",yytext);return(assign);}
[<]	{fprintf(yyout,"LESS_THAN:%s",yytext);return(lessthan);}
[>]	{fprintf(yyout,"GREATER_THAN:%s",yytext);return(greathan);}
[&]	{fprintf(yyout,"AND:%s",yytext);return(and);}
[|]	{fprintf(yyout,"BIT_OR:%s",yytext);return(bitor);}
\{      {fprintf(yyout,"OP_BRACES: %s\n",yytext); return(opbr);}
\}       {fprintf(yyout,"CL_BRACES : %s\n",yytext); return(clbr);}
[\[]       {fprintf(yyout,"OP_SQBRCT : %s\n",yytext); return(opsqbr);}
[\]] {fprintf(yyout,"CL_SQBRCT : %s\n",yytext); return(clsqbr);}
\"(.)*\" {yylval.string = strdup(yytext); fprintf(yyout,"STRING : %s\n",yytext); return(string);}
\/\/.* {;};
\/\*(.*\n)*.*\*\/ {;};
.    
\n 
%%







