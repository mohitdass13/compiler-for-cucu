# compiler-for-cucu


1.cucu.l

int the lex file first write the regex fo matching the tokens 
to run the code you have to run the foollowing commands
"flex cucu.l"
"bison -d cucu.y"
"cc lex.yy.c cucu.tab.c -o cucu"
"./cucu Sample1.cu"
"./cucu Sample2.cu"


in this file foloeing constructs are allowed 
variable declaration 
function declaration
function definition
variable definition
if else construct 
while comstruct 


ASUMPTIONs
 
in this file i have not included the include of library 
multiple variable declareation is not allowed 
printf and scanf constructs are not allowed 



points to be noted:
if while running the file if it will give the warnig the please ignore the warnings 
and continue with above mentioned cpommnads

in pARSER 
folowing operations are allowed 
plus 
minus 
multiplication
division
comaparator 

statement in the code can be 
a variable declaration 
function declaration 
function callinfg 
function declaration
