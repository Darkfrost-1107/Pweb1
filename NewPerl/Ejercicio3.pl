#!\xampp\perl\bin\perl

use strict;
use warnings;

sub inv($){
    if(length($_[0]) == 0){
        return $_[0];  
    }
    else{
        return substr($_[0],length($_[0])-1,1). inv(substr($_[0] , 0 , length($_[0])-1));
    }
}

print "\nIngrese un String:";
my $s = <STDIN>;
print "Inverso: ".inv($s);


