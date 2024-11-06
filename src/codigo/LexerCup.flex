package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

// Definición de patrones
espacio = [ \t\r\n]+
numero_decimal = [-]?([0-9]+\.[0-9]+)
letra = [a-zA-Z]
fecha = (20[0-9]{2}|2[1-9][0-9]{2})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])
hora = (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])

%{
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/* Ignorar */}

/* Comentarios */
"//".* {/* Ignorar */}

/* Tokens definidos */
"TRACKPOINT" { return symbol(sym.Inicio, yytext()); }
"END_TRACKPOINT" { return symbol(sym.Final, yytext()); }
"Lat" { return symbol(sym.Latitud, yytext()); }
"Lon" { return symbol(sym.Longitud, yytext()); }
"=" { return symbol(sym.SignoIgual, yytext()); }
"TIME" { return symbol(sym.Tiempo, yytext()); }
"SPEED" { return symbol(sym.Velocidad, yytext()); }
"<" { return symbol(sym.Menor, yytext()); }
">" { return symbol(sym.Mayor, yytext()); }
{numero_decimal} { return symbol(sym.Numero, yytext()); }
{letra}+ { return symbol(sym.Letra, yytext()); }
{fecha} { return symbol(sym.Fecha, yytext()); }
{hora} { return symbol(sym.Horasegmin, yytext()); }
. { return symbol(sym.ERROR, yytext()); }
