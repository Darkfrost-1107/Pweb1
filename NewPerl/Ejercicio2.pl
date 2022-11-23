#!\xampp\perl\bin\perl
use strict;
use warnings;

sub mayor(@){
    my $m = $_[0];
    for(my $i = 0; $i < scalar(@_); $i++){
        if($m < $_[$i]){
            $m = $_[$i];
        }
    }
    return $m;
}

print "Cuantos numeros desea Ingresar ? :";
my $n = <STDIN>;
my $e = 0;
my @a;

for(my $i = 1; $i<= $n; $i++ ){
    do{
        print "Ingrese un numero entero positivo [$i]: ";
        $e = <STDIN>;
        if ($e<=0){
            print "\nIngrese un valor entero positivo\n"
        }
    } while($e <= 0);
    push(@a,$e);
}

print "\nEl mayor es :".mayor(@a);

