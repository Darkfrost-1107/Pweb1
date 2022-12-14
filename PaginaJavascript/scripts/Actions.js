function Solve(w1,x1,y1,z1,com){

    let a = null, b = null;
    if(com != null){
        if(com.length != 0 ){
            a = com.substr(0,1);
            b = com.substring(1);
        }
    }

    if(w1 == null){
        return Solve(x1,y1,z1,a,b);
    }

    if(x1 == null || x1 == "."){
        return w1;
    }

    if(!isNaN(x1) || x1 == "."){
        return Solve(Concat(w1,x1),y1,z1,a,b);
    }

    switch(x1){
        case "+":
        case "-":
            return Operate(w1,x1,Solve("",y1,z1,a,b));
        case "*":
        case "/":
            if(isNaN(z1)||z1==null){
                return Solve("",Operate(w1,x1,y1),z1,a,b);
            }else
                return Solve(w1,x1,Concat(y1,z1),a,b);
        case "(":
                return Operate(w1,"*",Solve("",y1,z1,a,b));
        case ")":
                return 
        case "%":
                return Solve(Operate(w1,x1),y1,z1,a,b);
        case " ":
            return Solve(w1,y1,z1,a,b);
    }
}

function Concat(a,b){
    return (a + b);
}

function Operate(a, sign, b){
    switch(sign){
        case "":
            return parseFloat(b);
        case "+":
            return parseFloat(a) + parseFloat(b);
        case "-":
            return parseFloat(a) - parseFloat(b);
        case "*":
            return +a * +b;
        case "/":
            return +a / +b;
        case "%":
            return +a * 0.01;
        default:
            return +a*10 + sign;
    }
}

function Chomp(x){
    return x.substring(0, x.length - 1);
}