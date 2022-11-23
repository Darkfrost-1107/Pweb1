use List::Util qw(min);
use List::Util qw(max);

@a= (10,12,16,19);
print "Promedio ".nprom(@a);

sub nprom(){
    $prom = 0;
    foreach $num (@_){
        $prom += $num;
    }
    $prom += max(@_)-min(@_);
    return $prom/scalar(@_); 
}