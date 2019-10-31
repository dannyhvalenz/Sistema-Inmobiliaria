#!/usr/bin/env perl

use strict;

# Módulos para desplegar errores
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use warnings;
use diagnostics;

# Indica donde cargar el modulo adhoc para el manejo de la BD
# MAC OS
use lib ('/Applications/MAMP/cgi-bin/Sistema-Inmobiliaria');
# Windows
# use lib ("c:\xampp\cgi-bin\Inmobiliaria");

# Se carga nuestro paquete
use Conexion;

my $cgi = CGI->new();
my $query = $cgi;
# la sección de acceso a Mysql
# Documentación en:
# https://metacpan.org/pod/DBD::mysql
my $dbh = conectar();
# Realizar el query sql
my $sth = $dbh->prepare("SELECT * FROM Inmueble");
$sth->execute() or die $DBI::errstr;


print $query->start_html(-lang => "es-MX", -title => "Mostrar", -encoding => "utf-8");
print ("<link
        href='https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap'
        rel='stylesheet'
/>

<link
        rel='stylesheet'
        href='https://www.w3schools.com/w3css/4/w3.css'/>
<link
        rel='stylesheet'
        href='https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'
/>");

print "<div>";
print "<thead>";

while (my @fila = $sth->fetchrow_array()){
	my ($idInmueble,$calle,$numExt,$numInt,$colonia,$ciudad,$observaciones,$servicios,$idPropietario,$tipoInmueble,$agua,$luz,$drenaje,$precio) = @fila;
        print "<div class='w3-row w3-white w3-third w3-padding-small'>";
        print "<div id='contenedor_propiedad' class='w3-white'>";
        print "<div class='w3-card'>";
        print "<img class='w3-right w3-round w3-image' src='http://localhost:8888/Sistema-Inmobiliaria/img/085a65681e4046398692b4f0bf58b1a0.jpg'/>";
        print "<h4 class='w3-margin-left'>$precio</h4>";
        print "<p class='w3-margin-left'>$tipoInmueble</p>";
        print "</div>";
        print "</div>";
        print "</div>";
}

        print "</div>";

$sth->finish();
$dbh->disconnect;