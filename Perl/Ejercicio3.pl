print "Ingrese un String:";
$s = <STDIN>;
print "Inverso".inv($s);

sub inv{
    $m = $_[0];
    $n = "";
    for(my $i = 1; $i <= length($m); $i++){
        $n = $n.substr($m,length($m)- $i,1);
    }
    return $n;
}