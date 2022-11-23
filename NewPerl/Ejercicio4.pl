#!\xampp\perl\bin\perl
use strict;
use warnings;
use List::Util qw(min);
use List::Util qw(max);

sub prom(@){
    my $prom = 0;
    foreach my $num (@_){
        $prom += $num;
    }
    return $prom/scalar(@_); 
}

sub nprom(@){
    my $prom = prom(@_)*scalar(@_);
    $prom += max(@_) - min(@_);
    return $prom/scalar(@_); 
}

my @a;
my $n;
print("Ingrese 0 para empezar el calculo :\n");
do{
    print("Ingrese una nota: ");
    $n = <STDIN>;
    if($n != 0){
        push(@a,$n);
    }
}while ($n != 0);
print "\nPromedio Original:".prom(@a);
print "\nPromedio Modificado:".nprom(@a);


