print "Ingrese el tamaño de un arrelgo de numeros y el arreglo de numeros;";
$n = <STDIN>;
@a = ();

for($i = 1; $i<= $n; $i++ ){
    $e = <STDIN>;
    push(@a,$e);
}

print "el mayor es :".mayor(@a);

sub mayor(){
    $m = $_[0];
    for($i = 0; $i < scalar(@_); $i++){
        if($m < $_[$i]){
            $m = $_[$i];
        }
    }
    return $m;
}