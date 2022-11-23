#!\xampp\perl\bin\perl
use strict;
use warnings;

print "Ingrese su nombre: ";
my $name = <STDIN>;
chomp $name;
print "\nHola ".$name.", Bienvenido!!!";