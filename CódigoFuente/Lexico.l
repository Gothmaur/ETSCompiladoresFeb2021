%{
	#include<stdio.h>
%}

D		[0-9]
L   [a-zA-Z_]
H		[a-fA-f0-9]
E		[Ee][+-]?[D]+
FS	[f|f|l|L]
IS	(u|U|l|L)

%%

"/*"        { printf(">Inicio de comentario>");}

"auto"|"typedef"|"static"|"extern"|"register"		{printf("<especificar tipo>");}
"break"|"if"|"else"|"switch"										{printf("<sentecia de control>");}
"do"|"while"|"for"															{printf("<ciclos>");}
"char"|"double"|"float"|"int"|"enum"|"void"			{printf("<clasificador de tipo>");}
"const"|"volatile"															{printf("<calificador de tipos>");}
"short"|"long"|"signed"|"unsigned"							{printgf("<modificador de tipos>");}
"continue"|"goto"																{printf("<Movimiento de seccion>");}
"default"|"case"|"return"												{printf("Reservadas");}
"sizeof"																				{printf("<operador>");}
"struct"|"union"																{printf("<estructura>");}

{L}({L}|{D})*																		{printf("<Identificador>");}

{D}+{IS}?																				{printf("Decimal entero");}
L?\"(\\.|[^\\"])*\"															{printf("Literal de cadena");}
L?'(\\.|[^\\'])+'																{printf("Literal de caracter");}


{D}+{E}{FS}?																		{printf("<Literal entera con exponencial>");}
{D}*"."{D}*({E}?)({FS})?												{printf("<Literal real con exponencial>");}

"<"|">"|"=="|"<="|">="|"!="											{printf("<Comparacion>");}
"&&"|"||"																				{printf("<Operador Logico>");}
"&" |"|"|"^"|"~"|"<<"|">>"											{printf("<Operador de Bit>");}
"++"																						{printf("<Incremento>");}
"--"																						{printf("<decremento>");}
"+"|"-"|"*"|"/"|"%"															{printf("<Operador aritmetico>");}
";"|","|("{"|"<%")|("}"|"%>") 									{printf("<Separadores>");}
"?"|":"																				 	{printf("<Condicional>");}
"=" 																						{printf("<asignacion>");}
"("|")"|("["|"<:")|("]"|":>") 									{printf("<agrupacion>");}
[\t\v\n\f]																			{printf(" ");}

%%

yywrap(){
  return(1)
}
