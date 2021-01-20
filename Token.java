public class Token{
    int clase;
    String valor;
    int type;

    public Token(int clase, String valor){
        this.clase = clase;
        this.valor = valor;
    }

    public Token(int clase, String valor, int type){
        this.clase = clase;
        this.valor = valor;
        this.type = type;
    }

    public Token(){       
    }

    public boolean equals(Token x){
        return this.clase == x.clase;
    }

    public boolean equals(int clase){
        return this.clase == clase;
    }
}
