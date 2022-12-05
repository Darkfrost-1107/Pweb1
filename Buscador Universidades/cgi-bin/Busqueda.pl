#!\xampp\perl\bin\perl
use strict;
use warnings;
use CGI;
use Text::CSV;

my $csv = Text::CSV->new({ sep_char => '|' });
  
sub Search(){
    my $q = CGI->new;
    my $Code = $q->param('Code');
    my $Name = $q->param('Name');
    my $Dep = $q->param('Department');
    my $Prog = $q->param('Program');

    my @Uni;
    my ($param,$find) = (1,1);
    my $failed = 0;

    if($Code ne ""){
        $param = 1;
    }
    else{
        $Code = 0;
    }

    if($Name ne ""){
        $param = 1;
        $Name = uc($Name);
    }
    else{
        $Name = "|";    
    }
=op
    if($Prog ne ""){
        $param = 1;
        $Prog = uc($Prog);
        print $Prog;
    }
    else{
        $param = "|";
        print $Prog;
    }

    if($Dep ne ""){
        $param = 1
        $Dep = uc($Dep)
    }
    else{
        $Dep = "|";
    }
=cut
    if($param != 0){
        open(DB,"../DB/Programas\ de\ Universidades2.csv") or die "no existe el archivo ._.";
        <DB>;
        while(my $line = <DB>){
            chomp $line;

            if($csv->parse($line)){
                $failed++;
                @Uni = $csv->fields();
                
                if($Uni[0] =~ $Code && $Uni[1] =~ $Name && $Uni[16] =~ $Prog  && $Uni[10] =~ $Dep){
                    open(BoxHTML,"..\\box.html") or die print "no existe el archivo ._.";
                    while(my $l = <BoxHTML>){   

                        if($l =~ "xNombrex" ){
                            print "<p> ".$Uni[1]." </p>";
                            next;
                        }   
                        elsif($l =~ "xLugarx" ){
                            print "<p> ".$Uni[10]." </p>";
                            next;
                        }                                                                                                
                        elsif($l =~ "xEspecialidadx" ){
                            print "<p> ".$Uni[16]." </p>";
                            next;
                        }
                        elsif($l =~ "xPx" ){
                            print "<p> ".$Uni[17]." </p>";
                            next;
                        }
                        elsif($l =~ "xIDx" ){
                            print "<p> ".$Uni[0]." </p>";
                            next;
                        }

                        print $l;

                    }
                    close(BoxHTML);
                }
            }
            else{
                print $line."</br>";
                last;
            }
        }
        close(DB);
        print $failed;
    }
    else{
        print $q->redirect("../index.html");
    }
}

=OP
open(TEXT, "../DB/Programas\ de\ Universidades.csv") or die "no existe el archivo ._.";
open(REWRITE,  "> ../DB/Programas\ de\ Universidades2.csv") or die "no existe el archivo ._.";
while(my $l =  <TEXT>){
    for(my $i = 0; $i != 6; $i++){
        if( $l =~ /MART(?[\w-[I]])N/){
            $l = "$`"."MARTIN"."$'";
        }
        if( $l =~ /HU(?[\w-[A]])NUCO/){
            $l = "$`"."HUANUCO"."$'";
        }
        if( $l =~ /CA(?[\w-[N]])ETE/){
            $l = "$`"."CANETE"."$'";
        }   
        if( $l =~ /JUN(?[\w-[I]])N/){
            $l = "$`"."JUNIN"."$'";
        }
        if( $l =~ /JA(?[\w-[E]])N/){
            $l = "$`"."JAEN"."$'";
        }
    }
    for(my $i = 0; $i != 3; $i++){
        if( $l =~ /TECNOL(?[\w-[O]])GICA/){
            $l = "$`"."TECNOLOGICA"."$'";
        }
        if( $l =~ /PROFEC(?[\w-[I]])A/){
            $l = "$`"."PROFECIA"."$'";
        }
        if( $l =~ /CAM(?[\w-[E]])LIDOS/){
            $l = "$`"."CAMELIDOS"."$'";
        }
        if( $l =~ /T(?[\w-[E]])CNICA/){
            $l = "$`"."TECNICA"."$'";
        }
        if( $l =~ /CONTEMPOR(?[\w-[A]])NEA/){
            $l = "$`"."CONTEMPORANEA"."$'";
        }  
        if( $l =~ /P(?[\w-[U]])BLICO/){
            $l = "$`"."PUBLICO"."$'";
        }
        if( $l =~ /PER(?[\w-[U]])\h/){
            $l = "$`"."PERU "."$'";
        }
        if( $l =~ /PER(?[\w-[U]])\|/){
            $l = "$`"."PERU\|"."$'";
        }
        if( $l =~ /ADMINISTRACI(?[\w-[O]])N/){
            $l = "$`"."ADMINISTRACION"."$'";
        }
        if( $l =~ /ACI(?[\w-[O]])N/){
            $l = "$`"."ACION"."$'";
        }
        if( $l =~ /CIENT(?[\w-[I]])FICA/){
            $l = "$`"."CIENTIFICA"."$'";
        }
        if( $l =~ /CAT(?[\w-[O]])LICA/){
            $l = "$`"."CATOLICA"."$'";
        }
        if( $l =~ /INGENIER(?[\w-[I]])A/){
            $l = "$`"."INGENIERIA"."$'";
        }
        if( $l =~ /GANADER(?[\w-[I]])A/){
            $l = "$`"."GANADERIA"."$'";
        }
        if( $l =~ /MAR(?[\w-[I]])TIM/){
            $l = "$`"."MARITIM"."$'";
        }
        if( $l =~ /C(?[\w-[E]])SAR/){
            $l = "$`"."CESAR"."$'";
        }
        if( $l =~ /MENCI(?[\w-[O]])N/){
            $l = "$`"."MENCION"."$'";
        }
        if( $l =~ /MAEST(R|)(?[\w-[I]])A/){
            $l = "$`"."MAESTRIA"."$'";
        }
        if( $l =~ /MAESTRIA.EN/){
            $l = "$`"."MAESTRIA EN"."$'";
        }
        if( $l =~ /INFORM(?[\w-[A]])TIC/){
            $l = "$`"."INFORMATIC"."$'";
        }
        if( $l =~ /GERIATR(?[\w-[I]])A/){
            $l = "$`"."GERIATRIA"."$'";
        }
        if( $l =~ /GERI(?[\w-[A]])TRIC/){
            $l = "$`"."GERIATRIC"."$'";
        }
        if( $l =~ /TRADUCCI(?[\w-[O]])N/){
            $l = "$`"."TRADUCCION"."$'";
        }
        if( $l =~ /ODONTOLOG(?[\w-[I]])A/){
            $l = "$`"."ODONTOLOGIA"."$'";
        }
        if( $l =~ /APUR(?[\w-[I]])MAC/){
            $l = "$`"."APURIMAC"."$'";
        }
        if( $l =~ /TRIBUTACI(?[\w-[O]])N/){
            $l = "$`"."TRIBUTACION"."$'";
        }
        if( $l =~ /GESTI(?[\w-[O]])N/){
            $l = "$`"."GESTION"."$'";
        }
        if( $l =~ /COMPLEMENTACI(?[\w-[O]])N/){
            $l = "$`"."COMPLEMENTACION"."$'";
        }
        if( $l =~ /ACAD(?[\w-[E]])MICA/){
            $l = "$`"."ACADEMICA"."$'";
        }
        if( $l =~ /SIST(?[\w-[E]])MICA/){
            $l = "$`"."SISTEMICA"."$'";
        }
        if( $l =~ /PSICOLOG(?[\w-[I]])A/){
            $l = "$`"."PSICOLOGIA"."$'";
        }
        if( $l =~ /(?[\w-[A]])NCASH/){
            $l = "$`"."ANCASH"."$'";
        }
        if( $l =~ /ENFERMER(?[\w-[I]])A/){
            $l = "$`"."ENFERMERIA"."$'";
        }
        if( $l =~ /TECNOLOG(?[\w-[I]])A/){
            $l = "$`"."TECNOLOGIA"."$'";
        }
        if( $l =~ /PSIQUIATR(?[\w-[I]])A/){
            $l = "$`"."PSIQUIATRIA"."$'";
        }
        if( $l =~ /RADIOLOG(?[\w-[I]])A/){
            $l = "$`"."RADIOLOGIA"."$'";
        }
        if( $l =~ /CONSTRUCCI(?[\w-[O]])N/){
            $l = "$`"."CONSTRUCCION"."$'";
        }
        if( $l =~ /EDUCACI(?[\w-[O]])N/){
            $l = "$`"."EDUCACION"."$'";
        }
        if( $l =~ /BILING(?[\w-[U]])E/){
            $l = "$`"."BILINGUE"."$'";
        }
        if( $l =~ / MAR(?[\w-[I]])A\|/){
            $l = "$`"." MARIA\|"."$'";
        }
        if( $l =~ / MAR(?[\w-[I]])A\h/){
            $l = "$`"." MARIA "."$'";
        }
        if( $l =~ /AGUST(?[\w-[I]])N\h/){
            $l = "$`"."AGUSTIN"."$'";
        }
        if( $l =~ /AC(?[\w-[U]])STICA/){
            $l = "$`"."ACUSTICA"."$'";
        }
        if( $l =~ /COMUNICACI(?[\w-[O]])N/){
            $l = "$`"."COMUNICACION"."$'";
        }
        if( $l =~ /INFORMACI(?[\w-[O]])N/){
            $l = "$`"."INFORMACION"."$'";
        }
        if( $l =~ /P(?[\w-[U]])BLICA/){
            $l = "$`"."PUBLICA"."$'";
        }
        if( $l =~ /M(?[\w-[E]])DICA/){
            $l = "$`"."MEDICA"."$'";
        }
        if( $l =~ /P(?[\w-[E]])DIC/){
            $l = "$`"."PEDIC"."$'";
        }
        if( $l =~ /PEDIATR(?[\w-[I]])A/){
            $l = "$`"."PEDIATRIA"."$'";
        }
        if( $l =~ /ECON(?[\w-[O]])MICO/){
            $l = "$`"."ECONOMICO"."$'";
        }
        if( $l =~ /COMPUTACI(?[\w-[O]])N/){
            $l = "$`"."COMPUTACION"."$'";
        }
        if( $l =~ /R(?[\w-[I]])MAC/){
            $l = "$`"."RIMAC"."$'";
        }
        if( $l =~ /DISE(?[\w-[N]])O/){
            $l = "$`"."DISENO"."$'";
        }
        if( $l =~ /CIRUG(?[\w-[I]])A/){
            $l = "$`"."CIRUGIA"."$'";
        }
        if( $l =~ /CL(?[\w-[I]])NICO/){
            $l = "$`"."CLINICO"."$'";
        }
        if( $l =~ /PATOL(?[\w-[O]])GICA/){
            $l = "$`"."PATOLOGICA"."$'";
        }
        if( $l =~ /OM(?[\w-[I]])A /){
            $l = "$`"."OMIA "."$'";
        }
        if( $l =~ /OM(?[\w-[I]])AS\|/){
            $l = "$`"."OMIA\|"."$'";
        }
        if( $l =~ /PRODUCCI(?[\w-[O]])N/){
            $l = "$`"."PRODUCCION"."$'";
        }
        if( $l =~ /ICI(?[\w-[O]])N/){
            $l = "$`"."ICION"."$'";
        }
        if( $l =~ /\hNI(?[\w-[N]])O/){
            $l = "$`"."NINO"."$'";
        }
        if( $l =~ /\hNI(?[\w-[N]])EZ/){
            $l = "$`"."NINEZ"."$'";
        }
        if( $l =~ /\hNI(?[\w-[N]])A/){
            $l = "$`"."NINA"."$'";
        }
        if( $l =~ /ESTIMULACI(?[\w-[O]])N/){
            $l = "$`"."ESTIMULACION"."$'";
        }
        if( $l =~ /PEDI(?[\w-[A]])TRIC/){
            $l = "$`"."PEDIATRIC"."$'";
        }
        if( $l =~ /F(?[\w-[I]])SIC/){
            $l = "$`"."FISIC"."$'";
        }
        if( $l =~ /QU(?[\w-[I]])MIC/){
            $l = "$`"."QUIMIC"."$'";
        }
        if( $l =~ /GR(?[\w-[A]])FICA/){
            $l = "$`"."GRAFICA"."$'";
        }
        if( $l =~ /LOG(?[\w-[I]])STICA/){
            $l = "$`"."LOGISTICA"."$'";
        }
        if( $l =~ /CRIST(?[\w-[O]])BAL/){
            $l = "$`"."CRISTOBAL"."$'";
        }
        if( $l =~ /G(?[\w-[E]])NERO/){
            $l = "$`"."GENERO"."$'";
        }
        if( $l =~ /L(?[\w-[O]])GICA/){
            $l = "$`"."LOGICA"."$'";
        }
        if( $l =~ /HOTELER(?[\w-[I]])A/){
            $l = "$`"."HOTELERIA"."$'";
        }
        if( $l =~ /AMAZON(?[\w-[I]])A/){
            $l = "$`"."AMAZONIA"."$'";
        }
        if( $l =~ /TR(?[\w-[O]])NIC/){
            $l = "$`"."TRONIC"."$'";
        }
        if( $l =~ /LOG(?[\w-[I]])A/){
            $l = "$`"."LOGIA"."$'";
        }
        if( $l =~ /I(?[\w-[O]])N\|/){
            $l = "$`"."ION\|"."$'";
        }
        if( $l =~ /I(?[\w-[O]])N\h/){
            $l = "$`"."ION "."$'";
        }
        if( $l =~ /QUIR(?[\w-[U]])RGICO/){
            $l = "$`"."QUIRURGICO"."$'";
        }
        if( $l =~ /AV(?[\w-[I]])COLA/){
            $l = "$`"."AVICOLA"."$'";
        }
        if( $l =~ /\|R(?[\w-[I]])O\h/){
            $l = "$`"."\|RIO "."$'";
        }
        if( $l =~ /ORG(?[\w-[A]])NICA/){
            $l = "$`"."ORGANICA"."$'";
        }
        if( $l =~ /CORAZ(?[\w-[O]])N/){
            $l = "$`"."CORAZON"."$'";
        }
        if( $l =~ /AUDITOR(?[\w-[I]])A/){
            $l = "$`"."AUDITORIA"."$'";
        }
        if( $l =~ /VALDIZ(?[\w-[A]])N/){
            $l = "$`"."VALDIZAN"."$'";
        }
        if( $l =~ /MORROP(?[\w-[O]])N/){
            $l = "$`"."MORROPON"."$'";
        }
        if( $l =~ /L(?[\w-[O]])GICO/){
            $l = "$`"."LOGICO"."$'";
        }
        if( $l =~ /GOG(?[\w-[I]])A/){
            $l = "$`"."GOGIA"."$'";
        }
        if( $l =~ /V(?[\w-[I]])TREO/){
            $l = "$`"."VITREO"."$'";
        }
        if( $l =~ /R(?[\w-[E]])GIMEN/){
            $l = "$`"."VITREO"."$'";
        }
        if( $l =~ /GUZM(?[\w-[A]])N/){
            $l = "$`"."GUZMAN"."$'";
        }
        if( $l =~ /EBANISTER(?[\w-[I]])A/){
            $l = "$`"."EBANISTERIA"."$'";
        }
        if( $l =~ /ECON(?[\w-[O]])MICA/){
            $l = "$`"."ECONOMICA"."$'";
        }
        if( $l =~ /AGRON(?[\w-[O]])MICA/){
            $l = "$`"."AGRONOMICA"."$'";
        }
        if( $l =~ /POL(?[\w-[I]])TIC/){
            $l = "$`"."POLITIC"."$'";
        }
        if( $l =~ /MATEM(?[\w-[A]])TICA/){
            $l = "$`"."MATEMATICA"."$'";
        }
        if( $l =~ /V(?[\w-[I]])STICA/){
            $l = "$`"."DISTICA"."$'";
        }
        if( $l =~ /D(?[\w-[I]])STICA/){
            $l = "$`"."DISTICA"."$'";
        }
        if( $l =~ /L(?[\w-[I]])STICA/){
            $l = "$`"."LISTICA"."$'";
        }
        if( $l =~ /M(?[\w-[E]])DICO/){
            $l = "$`"."MEDICO"."$'";
        }
        if( $l =~ /H(?[\w-[I]])DRICO/){
            $l = "$`"."HIDRICO"."$'";
        }
        if( $l =~ /HIDR(?[\w-[A]])ULICA/){
            $l = "$`"."HIDRAULICA"."$'";
        }
        if( $l =~ /JER(?[\w-[O]])NIMO/){
            $l = "$`"."JERONIMO"."$'";
        }
        if( $l =~ /MEC(?[\w-[A]])NICA/){
            $l = "$`"."MECANICA"."$'";
        }
        if( $l =~ /CL(?[\w-[I]])NICA/){
            $l = "$`"."CLINICA"."$'";
        }
        if( $l =~ /SC(?[\w-[E]])NICA/){
            $l = "$`"."SCENICA"."$'";
        }
        if( $l =~ /DIET(?[\w-[E]])TICA/){
            $l = "$`"."DIETETICA"."$'";
        }
        if( $l =~ / (?[\w-[E]])TICA/){
            $l = "$`"." ETICA"."$'";
        }
        if( $l =~ /\|(?[\w-[E]])TICA/){
            $l = "$`"."\|ETICA"."$'";
        }
        if( $l =~ /TERAP(?[\w-[E]])UTIC/){
            $l = "$`"."TERAPEUTIC"."$'";
        }
        if( $l =~ /FILOSOF(?[\w-[I]])A/){
            $l = "$`"."FILOSOFIA"."$'";
        }
        if( $l =~ /M(?[\w-[U]])SICA/){
            $l = "$`"."MUSICA"."$'";
        }
        if( $l =~ /ECONOM(?[\w-[I]])A/){
            $l = "$`"."ECONOMIA"."$'";
        }
        if( $l =~ /TUR(?[\w-[I]])STIC/){
            $l = "$`"."TURISTIC"."$'";
        }
        if( $l =~ /CURADUR(?[\w-[I]])A/){
            $l = "$`"."CURADURIA"."$'";
        }
        if( $l =~ /ACU(?[\w-[A]])TIC/){
            $l = "$`"."ACUATIC"."$'";
        }
        if( $l =~ /HIPERB(?[\w-[A]])RICA/){
            $l = "$`"."HIPERBARICA"."$'";
        }
        if( $l =~ /TOR(?[\w-[I]])A\|/){
            $l = "$`"."TORIA\|"."$'";
        }
        if( $l =~ /TOR(?[\w-[I]])A /){
            $l = "$`"."TORIA "."$'";
        }
        if( $l =~ /JER(?[\w-[I]])A /){
            $l = "$`"."JERIA "."$'";
        }
        if( $l =~ /JER(?[\w-[I]])A\|/){
            $l = "$`"."JERIA\|"."$'";
        }
        if( $l =~ /YER(?[\w-[I]])A\|/){
            $l = "$`"."YERIA "."$'";
        }
        if( $l =~ /\hV(?[\w-[I]])A\h/){
            $l = "$`"." VIA "."$'";
        }
        if( $l =~ /\hV(?[\w-[I]])AS\h/){
            $l = "$`"." VIAS "."$'";
        }
        if( $l =~ /HERN(?[\w-[A]])NDEZ/){
            $l = "$`"."HERNANDEZ"."$'";
        }
        if( $l =~ /VISI(?[\w-[O]])N\h/){
            $l = "$`"."VISION "."$'";
        }
        if( $l =~ /VISI(?[\w-[O]])N\|/){
            $l = "$`"."VISION\|"."$'";
        }
        if( $l =~ /COMPA(?[\w-[N]])(?[\w-[I]])A/){
            $l = "$`"."COMPANIA"."$'";
        }
        if( $l =~ /CIUDADAN(?[\w-[I]])A/){
            $l = "$`"."CIUDADANIA"."$'";
        }
        if( $l =~ /AGR(?[\w-[I]])COLA/){
            $l = "$`"."AGRICOLA\|"."$'";
        }
        if( $l =~ /PAT(?[\w-[I]])A\|/){
            $l = "$`"."PATIA\|"."$'";
        }
        if( $l =~ /JUR(?[\w-[I]])DIC/){
            $l = "$`"."JURIDIC"."$'";
        }
        if( $l =~ /MEC(?[\w-[A]])NICO/){
            $l = "$`"."MECANICO"."$'";
        }
        if( $l =~ /EL(?[\w-[E]])CTRIC/){
            $l = "$`"."ELECTRIC"."$'";
        }
        if( $l =~ /CARRI(?[\w-[O]])N/){
            $l = "$`"."CARRION"."$'";
        }
        if( $l =~ /RODR(?[\w-[I]])GUEZ/){
            $l = "$`"."RODRIGUEZ"."$'";
        }
        if( $l =~ /ANT(?[\w-[U]])NEZ/){
            $l = "$`"."ANTUNEZ"."$'";
        }
        if( $l =~ /ESTRAT(?[\w-[E]])GICA/){
            $l = "$`"."RODRIGUEZ"."$'";
        }
        if( $l =~ /SE(?[\w-[N]])OR DE SIP(?[\w-[N]])N/){
            $l = "$`"."SENOR DE SIPAN"."$'";
        }
        if( $l =~ /ROB(?[\w-[O]])TICA/){
            $l = "$`"."ROBOTICA"."$'";
        }
        if( $l =~ /TRONOM(?[\w-[I]])A/){
            $l = "$`"."TRONOMIA"."$'";
        }
        if( $l =~ /ON(?[\w-[O]])MIC/){
            $l = "$`"."ONOMIC"."$'";
        }
        if( $l =~ /BRASILE(?[\w-[N]])AS/){
            $l = "$`"."BRASILENAS"."$'";
        }
        if( $l =~ /EST(?[\w-[A]])TICA/){
            $l = "$`"."ESTATICA"."$'";
        }
        if( $l =~ /M(?[\w-[A]])TICA\|/){
            $l = "$`"."MATICA\|"."$'";
        }
        if( $l =~ /M(?[\w-[A]])TIC/){
            $l = "$`"."MATIC"."$'";
        }
        if( $l =~ /N(?[\w-[O]])STICO /){
            $l = "$`"."NOSTICO "."$'";
        }
        if( $l =~ /M(?[\w-[A]])TICO\|/){
            $l = "$`"."MATICO "."$'";
        }
        if( $l =~ /PAC(?[\w-[I]])FICO/){
            $l = "$`"."PACIFICO"."$'";
        }
        if( $l =~ /JES(?[\w-[U]])S/){
            $l = "$`"."JESUS"."$'";
        }
        if( $l =~ /INVERSI(?[\w-[O]])N/){
            $l = "$`"."INVERSION"."$'";
        }
        if( $l =~ /DID(?[\w-[A]])CTICA/){
            $l = "$`"."DIDACTICA"."$'";
        }
        if( $l =~ /CURR(?[\w-[I]])CULO/){
            $l = "$`"."CURRICULO"."$'";
        }
        if( $l =~ /ENSE(?[\w-[N]])ANZA/){
            $l = "$`"."ENSENANZA"."$'";
        }
        if( $l =~ /TEOR(?[\w-[I]])A/){
            $l = "$`"."TEORIA"."$'";
        }
        if( $l =~ /TE(?[\w-[O]])RIC/){
            $l = "$`"."TEORIC"."$'";
        }
        if( $l =~ /CR(?[\w-[I]])TIC/){
            $l = "$`"."CRITIC"."$'";
        }
        if( $l =~ /ANAL(?[\w-[I]])TIC/){
            $l = "$`"."ANALITIC"."$'";
        }
        if( $l =~ /B(?[\w-[A]])SICA/){
            $l = "$`"."BASICA"."$'";
        }
        if( $l =~ /MINER(?[\w-[I]])A/){
            $l = "$`"."MINERIA"."$'";
        }
        if( $l =~ /PESQUER(?[\w-[I]])A/){
            $l = "$`"."PESQUERIA"."$'";
        }
        if( $l =~ /LOG(?[\w-[I]])STICO/){
            $l = "$`"."LOGISTICO"."$'";
        }
        if( $l =~ /PEDAG(?[\w-[O]])GICO/){
            $l = "$`"."PEDAGOGICO"."$'";
        }
        if( $l =~ /PEDAG(?[\w-[O]])GICA/){
            $l = "$`"."PEDAGOGICA"."$'";
        }
        if( $l =~ /(?[\w-[A]])LISIS/){
            $l = "$`"."ALISIS"."$'";
        }
        if( $l =~ /T(?[\w-[O]])RAX/){
            $l = "$`"."TORAX"."$'";
        }
        if( $l =~ /MET(?[\w-[A]])LICA/){
            $l = "$`"."METALICA"."$'";
        }
        if( $l =~ /BOT(?[\w-[A]])NICA/){
            $l = "$`"."BOTANICA"."$'";
        }
        if( $l =~ /BIO(?[\w-[E]])TICA/){
            $l = "$`"."BIOETICA"."$'";
        }
        if( $l =~ /UNI(?[\w-[O]])N/){
            $l = "$`"."UNION"."$'";
        }
        if( $l =~ /METAL(?[\w-[U]])RGICA/){
            $l = "$`"."METALURGICA"."$'";
        }
        if( $l =~ /ENERG(?[\w-[I]])A/){
            $l = "$`"."ENERGIA"."$'";
        }
        if( $l =~ /ENERG(?[\w-[E]])TIC/){
            $l = "$`"."ENERGETIC"."$'";
        }
        if( $l =~ /GR(?[\w-[A]])FICO/){
            $l = "$`"."GRAFICO"."$'";
        }
        if( $l =~ /GRAF(?[\w-[I]])A/){
            $l = "$`"."GRAFIA"."$'";
        }
        if( $l =~ /ACOMPA(?[\w-[N]])A/){
            $l = "$`"."ACOMPANA"."$'";
        }
        if( $l =~ /INCLUSI(?[\w-[O]])N/){
            $l = "$`"."INCLUSION"."$'";
        }
        if( $l =~ /AUT(?[\w-[O]])NOMA/){
            $l = "$`"."AUTONOMA"."$'";
        }
        if( $l =~ /AGR(?[\w-[O]])NOMA/){
            $l = "$`"."AGRONOMA"."$'";
        }
        if( $l =~ /F(?[\w-[A]])RMACO/){
            $l = "$`"."FARMACO"."$'";
        }
        if( $l =~ /PR(?[\w-[A]])CTICA/){
            $l = "$`"."PRACTICA"."$'";
        }
        if( $l =~ /C(?[\w-[E]])UTICO/){
            $l = "$`"."CEUTICO"."$'";
        }
        if( $l =~ /J(?[\w-[O]])VEN/){
            $l = "$`"."JOVEN"."$'";
        }
        if( $l =~ /C(?[\w-[E]])RVICO/){
            $l = "$`"."FARMACO"."$'";
        }
        if( $l =~ /JOS(?[\w-[E]])/){
            $l = "$`"."JOSE"."$'";
        }
        if( $l =~ /AM(?[\w-[E]])RICA/){
            $l = "$`"."AMERICA"."$'";
        }
        if( $l =~ /S(?[\w-[O]])FICA\|/){
            $l = "$`"."SOFICA\|"."$'";
        }
        if( $l =~ /INGL(?[\w-[E]])S/){
            $l = "$`"."INGLES"."$'";
        }
        if( $l =~ /LING(?[\w-[U]])(?[\w-[I]])STICA/){
            $l = "$`"."LINGUISTICA"."$'";
        }
        if( $l =~ /AMAZ(?[\w-[O]])NICO/){
            $l = "$`"."AMAZONICO"."$'";
        }
        if( $l =~ /ESTRAT(?[\w-[E]])GICO/){
            $l = "$`"."ESTRATEGICO"."$'";
        }
        if( $l =~ /CHEP(?[\w-[E]])N/){
            $l = "$`"."CHEPEN"."$'";
        }
        if( $l =~ /ART(?[\w-[I]])STICA/){
            $l = "$`"."ARTISTICA"."$'";
        }
        if( $l =~ /T(?[\w-[E]])TRIC/){
            $l = "$`"."TETRIC"."$'";
        }
        if( $l =~ /SE(?[\w-[N]])ALES/){
            $l = "$`"."SENALES"."$'";
        }
        if( $l =~ /(?[\w-[O]])NICA /){
            $l = "$`"."ONICA "."$'";
        }
        if( $l =~ /(?[\w-[O]])NICA\|/){
            $l = "$`"."ONICA\|"."$'";
        }
        if( $l =~ /(?[\w-[O]])NICAS\|/){
            $l = "$`"."ONICAS\|"."$'";
        }
        if( $l =~ /IZACI(?[\w-[O]])N/){
            $l = "$`"."IZACION"."$'";
        }
        if( $l =~ /DERECHO.CON/){
            $l = "$`"."DERECHO CON"."$'";
        }
        if( $l =~ /FRANC(?[\w-[E]])S/){
            $l = "$`"."FRANCES"."$'";
        }
        if( $l =~ /ALEM(?[\w-[A]])N/){
            $l = "$`"."ALEMAN"."$'";
        }
        if( $l =~ /PORTUGU(?[\w-[E]])S/){
            $l = "$`"."PORTUGUES"."$'";
        }
        if( $l =~ /ANAST(?[\w-[E]])SICA/){
            $l = "$`"."ANASTESICA"."$'";
        }
        if( $l =~ /CAMAN(?[\w-[A]])/){
            $l = "$`"."CAMANA"."$'";
        }
        if( $l =~ /S(?[\w-[O]])LIDO/){
            $l = "$`"."SOLIDO"."$'";
        }
        if( $l =~ /GEN(?[\w-[E]])TIC/){
            $l = "$`"."GENETIC"."$'";
        }
        if( $l =~ /IND(?[\w-[I]])GENA/){
            $l = "$`"."INDIGENA"."$'";
        }
        if( $l =~ /COMPRENSI(?[\w-[O]])N/){
            $l = "$`"."COMPRENSION"."$'";
        }
        if( $l =~ /HIST(?[\w-[O]])RICO/){
            $l = "$`"."HISTORICO"."$'";
        }
        if( $l =~ /N(?[\w-[A]])UTICA/){
            $l = "$`"."NAUTICA"."$'";
        }
        if( $l =~ /C(?[\w-[E]])UTICA/){
            $l = "$`"."CEUTICA"."$'";
        }
        if( $l =~ /ACU(?[\w-[I]])COLA/){
            $l = "$`"."ACUICOLA"."$'";
        }
        if( $l =~ /NOM(?[\w-[I]])A/){
            $l = "$`"."NOMIA"."$'";
        }
        if( $l =~ /CORP(?[\w-[O]])REA/){
            $l = "$`"."CORPOREA"."$'";
        }
        if( $l =~ /FUSI(?[\w-[O]])N/){
            $l = "$`"."FUSION"."$'";
        }
        if( $l =~ /RELIGI(?[\w-[O]])N/){
            $l = "$`"."ACUICOLA"."$'";
        }
        if( $l =~ /SAN ROM(?[\w-[A]])N/){
            $l = "$`"."SAN ROMAN"."$'";
        }
        if( $l =~ /RAM(?[\w-[O]])N/){
            $l = "$`"."RAMON"."$'";
        }
        if( $l =~ /ESPEC(?[\w-[I]])FICA/){
            $l = "$`"."ESPECIFICA"."$'";
        }
        if( $l =~ /CELEND(?[\w-[I]])N/){
            $l = "$`"."CELENDIN"."$'";
        }
        if( $l =~ /DIN(?[\w-[A]])MICA/){
            $l = "$`"."DINAMICA"."$'";
        }
        if( $l =~ /M(?[\w-[A]])QUINA/){
            $l = "$`"."MAQUINA"."$'";
        }
        if( $l =~ /SF(?[\w-[E]])RICA/){
            $l = "$`"."SFERICA"."$'";
        }
        if( $l =~ /SCOP(?[\w-[I]])A/){
            $l = "$`"."SCOPIA"."$'";
        }
        if( $l =~ /SC(?[\w-[O]])PIC/){
            $l = "$`"."SCOPIC"."$'";
        }
        if( $l =~ /LEGU(?[\w-[I]])A/){
            $l = "$`"."LEGUIA"."$'";
        }
        if( $l =~ /M(?[\w-[A]])STER/){
            $l = "$`"."MASTER"."$'";
        }
        if( $l =~ /PL(?[\w-[A]])STICA/){
            $l = "$`"."PLASTICA"."$'";
        }
        if( $l =~ /C(?[\w-[A]])STICO/){
            $l = "$`"."CASTICO"."$'";
        }
        if( $l =~ /M(?[\w-[A]])XILO/){
            $l = "$`"."MAXILO"."$'";
        }
        if( $l =~ /PETR(?[\w-[O]])LEO/){
            $l = "$`"."PETROLEO"."$'";
        }
        if( $l =~ /TECT(?[\w-[O]])NICO/){
            $l = "$`"."TECTONICO"."$'";
        }
        if( $l =~ /T(?[\w-[I]])TULO/){
            $l = "$`"."TITULO"."$'";
        }
        if( $l =~ /B(?[\w-[I]])BLICA/){
            $l = "$`"."BIBLICA"."$'";
        }
        if( $l =~ /A(?[\w-[E]])REO/){
            $l = "$`"."AEREO"."$'";
        }
        if( $l =~ / (?[\w-[A]])REA/){
            $l = "$`"." AREA"."$'";
        }
        if( $l =~ /S(?[\w-[A]])NCHEZ/){
            $l = "$`"."SANCHEZ"."$'";
        }
        if( $l =~ /ICHU(?[\w-[N]])A/){
            $l = "$`"."ICHUNA"."$'";
        }
        if( $l =~ /PEQUE(?[\w-[N]])OS/){
            $l = "$`"."PEQUENOS"."$'";
        }
        if( $l =~ /QUIR(?[\w-[U]])RGIC/){
            $l = "$`"."QUIRURGIC"."$'";
        }
        if( $l =~ /M(?[\w-[E]])STICO/){
            $l = "$`"."MESTICO"."$'";
        }
        if( $l =~ /IM(?[\w-[A]])GENES/){
            $l = "$`"."IMAGENES"."$'";
        }
        if( $l =~ /T(?[\w-[U]])NELES/){
            $l = "$`"."TUNELES"."$'";
        }
        if( $l =~ /CAN(?[\w-[O]])NICO/){
            $l = "$`"."CANONICO"."$'";
        }
        #CUIDADOS INTENSIVOS � ADULTO
        if( $l =~ /CUIDADOS INTENSIVOS . ADULTO/){
            $l = "$`"."CUIDADOS INTENSIVOS PARA ADULTO"."$'";
        }
        if( $l =~ /ESPA(?[\w-[N]])OL/){
            $l = "$`"."ESPANOL"."$'";
        }
        if( $l =~ /C(?[\w-[I]])VICA/){
            $l = "$`"."CIVICA"."$'";
        }
        if( $l =~ /MARA(?[\w-[N]])(?[\w-[O]])N/){
            $l = "$`"."MARANON"."$'";
        }
        if( $l =~ /C(?[\w-[A]])NCER/){
            $l = "$`"."CANCER"."$'";
        }
        if( $l =~ /ECONOMETR(?[\w-[I]])A/){
            $l = "$`"."ECONOMETRIA"."$'";
        }
        if( $l =~ /ASESOR(?[\w-[I]])A/){
            $l = "$`"."ASESORIA"."$'";
        }
        if( $l =~ /ECLESI(?[\w-[A]])STICO/){
            $l = "$`"."ECLESIASTICO"."$'";
        }
        # CUIDADOS INTENSIVOS � NEONATOLOGIA
        if( $l =~ /CUIDADOS INTENSIVOS . NEONATOLOGIA/){
            $l = "$`"."CUIDADOS INTENSIVOS Y NEONATOLOGIA"."$'";
        }
    }
    print REWRITE $l;
}

close(TEXT);
close(REWRITE);
=cut

print "Content-type: text/html\n\n";
open(MainHTML,"..\\index.html") or die print "no existe el archivo ._.";
while(my $l = <MainHTML>){   
    
    if($l =~ "xStylex" ){
        print "<link rel=\"stylesheet\" href=\"../css/style.css\">";
        next;
    }   
    elsif($l =~ "xFormx" ){
        print "<form action=\"./Busqueda.pl\" method=\"GET\">";
        next;
    }                                                                                                
    elsif($l =~ "xSearchx" ){
        Search();
        next;
    }
    elsif($l =~ "xIconx" ){
        print "<img id =\"icon\" src=\"../Images/UNSA-Icon.png\" alt=\"img unsa\">";
        next;
    }

    print $l;
    
}
close(MainHTML);

