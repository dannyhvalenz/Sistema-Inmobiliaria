

use strict;
use warnings;
use diagnostics;
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);

use DBI;
use DBI::mysql;

#Definicion de variables
my $BD = "Inmobiliaria";
my $host = "localhost";
my $puerto = "3306";
my $tabla = "Asesor";
my $user = "root";
my $pwd = "12345";

#Declarar cadena de conexion
my $dsn = "dbi:mysql:$BD:$host:$puerto";

#Abrir una conexion
my $dbh = DBI->connect($dsn, $user, $pwd);

#Realizar el query sql
my $sth = $dbh->prepare("select * from $tabla");
$sth->execute();

$dbh->disconnect;

#Procesar el resultado
print "Content-type: txt/html\n\n";
my $contador = 1;
while(my $row = $sth->fetchrow_hashref){
    print "Asesor:" . $contador . "<br>";
    print "Nombre:" . $row->{nombre} . "<br>";
    print "A. Paterno:" . $row->{apellidoP} . "<br>";
    print "A. Materno:" . $row->{apellidoM} . "<br>";
    print "Correo:" . $row->{correo} . "<br>";
    print "Telefono:" . $row->{telefono} . "<br>";
    print "<hr>";
    $contador++;
}