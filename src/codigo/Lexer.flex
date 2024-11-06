package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
//Relizar la definicion
espacio=[" ",\t,\r,\n]+
numero=[0-9]+\.[0-9]+
letra=[a-zA-Z]
fecha = (20[0-9]{2}|2[1-9][0-9]{2})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])
Horas = (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])

%{
 public String lexeme;
%}
%%


{espacio} {/*Ignore*/} 
"//".* {/*Ignore*/}
"TRACKPOINT" {lexeme=yytext(); return Inicio; }
"END_TRACKPOINT" {lexeme=yytext(); return Final; }
"Lat" {lexeme=yytext(); return Latitud; }
"Lon" {lexeme=yytext(); return Longitud; }
"=" {lexeme=yytext(); return SignoIgual; }
"TIME" {lexeme=yytext(); return Tiempo; }
"SPEED" {lexeme=yytext(); return Velocidad; }
("<") {lexeme=yytext(); return Menor; }
(">") {lexeme=yytext(); return Mayor; }
{numero} {lexeme=yytext(); return numero; }
{letra} {lexeme=yytext(); return Letra; }
{fecha} {lexeme=yytext(); return Fecha; }
{Horas} { lexeme=yytext(); return Horasegmin; }
"-" {lexeme=yytext(); return Guion; }
. {lexeme=yytext(); return ERROR;}