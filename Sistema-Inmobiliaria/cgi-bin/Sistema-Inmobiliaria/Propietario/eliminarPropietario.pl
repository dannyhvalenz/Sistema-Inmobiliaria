#!/usr/bin/env perl

use strict;

# Módulos para desplegar errores
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use warnings;
use diagnostics;

# Indica donde cargar el modulo adhoc para el manejo de la BD
# MAC OS
use lib ('/Applications/MAMP/cgi-bin/Inmobiliaria');
# Windows
# use lib ("c:\xampp\cgi-bin\Inmobiliaria");

# Se carga nuestro paquete
use Conexion;

print CGI::header();

my $cgi = CGI->new();
my $query = $cgi;
my $idPropietario = $query->param("idPropietario");

# la sección de acceso a Mysql
# Documentación en:
# https://metacpan.org/pod/DBD::mysql
my $dbh = conectar();
# Realizar el query sql
my $sth = $dbh->prepare("DELETE from Propietario where idPropietario=?");
$sth->execute($idPropietario) or die $DBI::errstr;

if ($sth->rows gt 0){
    print $query->start_html(-lang => "es-MX", -title => "Registro", -encoding => "utf-8");
    print $query->h1("El propietario ha sido eliminado exitosamente");
}
else {
    print $query->start_html(-lang => "es-MX", -title => "Registro", -encoding => "utf-8");
    print $query->h1("El propietario no sido eliminado");
}

$sth->finish();
$dbh->disconnect;