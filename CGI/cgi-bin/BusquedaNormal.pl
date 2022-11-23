#!\xampp\perl\bin\perl
use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $target = $q->param('search');
#Proceso para cambiar los espacion por + como en la url de google
$target = join("+", split(" ", $target));

print $q->redirect("https://www.google.com.pe/search?q=$target&source=hp");