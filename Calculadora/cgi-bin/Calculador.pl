#!\xampp\perl\bin\perl
use strict;
use warnings;
use CGI;

sub calcular($$$) {
    my($p1, $p2, $p3) = @_;
    
    if ($p3 ne "*" && $p3 ne "+" && $p3 ne "-" && $p3 ne "/" && $p3 ne ""){
        
        if($p2 eq "+"){
            $p1 += $p3;
        }
        elsif ($p2 eq "-"){
            $p1 -= $p3;
        }
        elsif ($p2 eq "*"){
            $p1 *= $p3;
        }
        elsif($p2 eq "/"){
            $p1 /= $p3;
        }
    }
    
    return $p1;
}
my $q = CGI->new;
my $sent = $q->param('exp');
my @ex =  split(" ", $sent);
my $res = $ex[0];
for(my $e = 0; $e < scalar(@ex) - 2; $e +=2){
    $res = calcular($res, $ex[$e+1], $ex[$e+2]);
}
print "Content-type: text/html\n\n";
print "<HTML><HEAD>\n";
print "<TITLE>Resultado</TITLE>\n";
print "</HEAD><BODY>\n";
print "<H3>Se ha calculado su resultado :$res</H3>\n";
print "<A href = \"../index.html\">regresar</A>\n";
print "</BODY>\n</HTML>\n";

