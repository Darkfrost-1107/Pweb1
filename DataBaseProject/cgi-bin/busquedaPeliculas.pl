#!\xampp\perl\bin\perl
use strict;
use warnings;
use CGI;
use DBI;

print "Content-type: text/html\n\n";
print "Empezando";


    #mostrar las bases aceptadas
my @dbs = DBI -> available_drivers();
for my $el (@dbs){
    print $el." \|";
}


=op
    #mostrar las bases de datos disponibles
    my @dbcol = DBI -> data_sources("DBM");
    for my $el (@dbcol){
    print $el." \|";
    }
=cut

#Init CGI
my $q = CGI->new;
my $DbQuery = "SELECT * FROM ";
my $id = $q->param('ID');
my $votes = $q->param('VoteCounter');
my $score = $q->param('Punctuation');
my $year = $q->param('Year');
my $search = $q->param('Search'); 

#Prepare DBQuery
if ($search eq "AC") {
    $DbQuery = $DbQuery."Actor\n";

    if($id ne ""){
        if(chomp($DbQuery) == 1){
            $DbQuery = $DbQuery." WHERE ";
        }
        else{
            $DbQuery = $DbQuery." AND ";
        }
        $DbQuery = $DbQuery." ActorID = $id";
    }
}
else{
    $DbQuery = $DbQuery."Movie\n";

    if( $id ne ""){
        if(chomp($DbQuery) == 1){
            $DbQuery = $DbQuery." WHERE ";
        }
        else{
            $DbQuery = $DbQuery." AND ";
        }
        $DbQuery = $DbQuery." MovieID = $id";
    }

    if($votes ne ""){
        if(chomp($DbQuery) == 1){
            $DbQuery = $DbQuery." WHERE ";
        }
        else{
            $DbQuery = $DbQuery." AND ";
        }
        $DbQuery = $DbQuery."Votes >= $votes";
    }

    if($score ne ""){
        if(chomp($DbQuery) == 1){
            $DbQuery = $DbQuery." WHERE ";
        }
        else{
            $DbQuery = $DbQuery." AND ";
        }
        $DbQuery = $DbQuery."Score >= $score";
    }

    if($year ne ""){
        if(chomp($DbQuery) == 1){
            $DbQuery = $DbQuery." WHERE ";
        }
        else{
            $DbQuery = $DbQuery." AND ";
        }
        $DbQuery = $DbQuery."Year = $year";
    }
}
#$DbQuery = $DbQuery.";";

#Print
open(HTML,"../html/index.html") or die("no se encontro al archivo");
while(my $l = <HTML>){
    if($l =~ /#ID#/){
        print "<input type = 'number' name = 'ID' placeholder='ID' value = '$id'>";
    }
    elsif($l =~ /#YEAR#/){
        print "<input type = 'number' name = 'Year' placeholder='Estreno' value= '$year'>";
    }
    elsif($l =~ /#VOTES#/){
        print "<input type = \"number\" name = \"VoteCounter\" placeholder=\"Min Votos\" value = '$votes'>";
    }
    elsif($l =~ /#SCORE#/){
        print "<input type = \"number\" name = \"Punctuation\" placeholder=\"Puntuacion / 10\" value = '$score'>";
    }
    elsif($l =~ /#SEARCH#/){
        print "<input type = \"text\" name = \"Search\" style = \"display:none\" value = \"$search\">";
    }
    elsif($l =~ /#ACT#/){
    
        #Connect to DB
        my $user = 'alumno';
        my $password = 'pweb1';
        my $dsn = "DBI:DBM:database=pweb1;host=192.168.1.106";

    print "Empezar ";
        my $dbh = DBI->connect($dsn, $user, $password) or die print "No se pudo conectar  $dsn!";
    print "BuscarXD --- ";
        my $sth = $dbh->prepare($DbQuery);
        $sth->execute();
    print "Imprimiendo ";
    

        while(my @row = $sth->fetchrow_array){
            for my $elem (@row){

                open(EL,"../html/element.html") or die("no se enocntro el archivo");
                
                    while(my $line = <EL>){
                        if($line =~ /#ELEMENT#/){
                            print $elem;
                        }
                        else{
                            print $line;
                        }
                    }
                close(EL);
            }
        }   

        print "Terminado";
        $sth->finish;
        #Finish Query
        $dbh->disconnect;

    }
    else{
        print $l;
    }
}
close(HTML);


