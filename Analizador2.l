
%%
%type Token
%eofval{
    return nextToken("", 0);
%eofval}
%line
%{
	public Token nextToken(String lex, int num){
        return new Token(num, lex);
    }

    public Token nextToken(String lex, int num, int type){
        return new Token(num, lex, type);
    }
    
%}

//IDENTIFICADORES
Digito = [0-9]
Letra = [a-zA-Z]
Letras_ = ({Letra}|\_)
Identificador = {Letras_}({Digito}|{Letras_})*

//Espacios
espacio=[ \r\n\tn]
esp=[ ]
esps = {espacio}+

//numeros enteros
Enteros = ((({Digito}+)(\_)?({Digito}+))+)|({Digito})+

//Decimales
Expo = [Ee][\+\-]?({Enteros})+
Decimal = (({Enteros}*\.{Digito}+)|({Enteros}+\.{Digito}*))
ExpoFlo = (({Decimal})({Expo}?))|(({Enteros})({Expo}))

// Cadenas
Carac = [\\\"]
Cadenas = (\"({Letra}|{Digito}|{Carac}|{esp}|{OP})+\"|\'({Letra}|{Digito}|{Carac}|{espacio}|{OP})+\')

//Booleanos
True = "true"
False = "false"

//operadores
Asig = \=
Parentesisabre = \(
Parentesiscierra = \)
Incremento = "++"
Disyuncion = "||"
And = "&&"
Igualque = "=="
Diferente = "!="
Menor = "<"
Mayor = ">"
Menorigual = "<="
Mayorigual = ">="
Suma = \+
Resta = \-
Mul = \*
Div = \/
Modulo = \%
Negacion =\!
Direccionmem = \&
OP =({Asig}|{Parentesisabre}|{Parentesiscierra}|{Incremento}|{Disyuncion}|{And}|{Igualque}|{Diferente}|{Menor}|{Mayor}|{Menorigual}|{Mayorigual}|{Suma}|{Resta}|{Mul}|{Div}|{Modulo}|{Negacion}|{Direccionmem})

//palabras reservadas
Int = int
Float = float
Char =char
Double = double
While = while
Do = do
Switch=switch
Case=case
If=if
Else=else
Default=default
Break=break
Func=func
Void = void
Return = return

%%
{esps} {/*ignorar*/}
{Switch} {return nextToken("", 1);}
{Case} {return nextToken("", 2);}
{If} {return nextToken("", 3);}
{Int} {return nextToken("", 4);}
{Float} {return nextToken("", 5);}
{Char} {return nextToken("", 6);}
{Double} {return nextToken("", 7);}
{Do} {return nextToken("", 8);}
{While} {return nextToken("", 9);}
{Else} {return nextToken("", 10);}
{Default} {return nextToken("", 11);}
{Break} {return nextToken("", 12);}
{Return} {return nextToken("", 47);}
{Func} {return nextToken("", 13);}
{Void} {return nextToken("", 14);}//agregue void, y recorri los numeros por la precedencia La May 11/01/21
";" {return nextToken("", 15);}
":" {return nextToken("", 16);}
"," {return nextToken("", 17);} //se agregaron los token faltantes JEF 11/01/21
"{" {return nextToken("", 18);} // Se agregaron los token faltantes AF 12/01/21
"}" {return nextToken("", 19);}
"[" {return nextToken("", 45);}
"]" {return nextToken("", 46);}
{Asig} {return nextToken("", 20);}
{Parentesisabre} {return nextToken("", 21);}
{Parentesiscierra} {return nextToken("", 22);}
{Incremento} {return nextToken("", 23);}
{Disyuncion} {return nextToken("", 24);}
{And} {return nextToken("", 25);}
{Igualque} {return nextToken("", 26);}
{Diferente} {return nextToken("", 27);}
{Menor} {return nextToken("", 28);}
{Mayor} {return nextToken("", 29);}
{Menorigual} {return nextToken("", 30);}
{Mayorigual} {return nextToken("", 31);}
{Suma} {return nextToken("", 32);}
{Resta} {return nextToken("", 33);}
{Mul} {return nextToken("", 34);}
{Div} {return nextToken("", 35);}
{Modulo} {return nextToken("", 36);}
{Negacion} {return nextToken("", 37);}
{Direccionmem} {return nextToken("", 38);}
{Enteros} {return nextToken("", 39);}
{ExpoFlo} {return nextToken("", 40);}
{Cadenas} {return nextToken("", 41);}
{True} {return nextToken("", 42);}
{False} {return nextToken("", 43);}
{Identificador} {return nextToken("", 44);}
. {System.out.println("Error Léxico");}
