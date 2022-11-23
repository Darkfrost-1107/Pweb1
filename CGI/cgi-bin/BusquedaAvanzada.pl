#!\xampp\perl\bin\perl
use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $inc = $q->param('include');
my $exct = $q->param('exact');
my $ex = $q->param('exclude');
#Proceso para cambiar los espacion por + como en la url de google
$inc = join("+", split(" ", $inc));
$exct = join("+", split(" ", $exct));
$ex = join("+", split(" ", $ex));

print $q->redirect("https://www.google.com.pe/search?as_q=$inc&as_epq=$exct&as_eq=$ex&source=hp");