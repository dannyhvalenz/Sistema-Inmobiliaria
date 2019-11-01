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
my $idAsesor = $query->param("idAsesor");
#my $idAsesor = "1";
# la sección de acceso a Mysql
# Documentación en:
# https://metacpan.org/pod/DBD::mysql
my $dbh = conectar();
# Realizar el query sql
my $sth = $dbh->prepare("SELECT * FROM Cliente WHERE idAsesor=?");
$sth->execute($idAsesor) or die $DBI::errstr;

# colocar el charset para imprimir correctamente los caracteres -- en este caso vamos a cambiar por el XML --
# https://metacpan.org/pod/XML::Writer
use XML::Writer;
my $fetch = '';
my $writer = XML::Writer->new(
    OUTPUT      => \$fetch,
    DATA_MODE   => 1,
    DATA_INDENT => 1
);

$writer->xmlDecl('UTF-8');
$writer->startTag('resultado');

# Procesar el resultado
# documentación de métodos disponibles:
# https://www.oreilly.com/library/view/mysql-reference-manual/0596002653/ch08s02.html
# https://metacpan.org/pod/release/RUDY/DBD-mysql-2.9008/lib/DBD/mysql.pm#Class_Methods
if ($sth->rows gt 0){
    while (my $row = $sth->fetchrow_hashref){
        my $nombre = $row->{nombre};
        my $apellidoP = $row->{apellidoP};
        my $apellidoM = $row->{apellidoM};
        my $nombreCompleto = "$nombre $apellidoP $apellidoM";
        $writer->startTag('div', class => 'w3-row w3-white w3-half w3-padding-small');
        $writer->startTag('div', class => 'w3-white', id => 'contenedor_propiedad');
        $writer->startTag('div', class => 'w3-card w3-hover-light-grey', onclick => "w3_open_actualizar(this.id)", id => "$row->{idCliente}" );
        $writer->dataElement('h4', $nombreCompleto, class => "w3-margin-left w3-margin-right");
        $writer->dataElement('label', "celular: ", class => "w3-margin-left");
        $writer->dataElement('label', $row->{celular}, class => "w3-margin-left");
        $writer->dataElement('label', $row->{idCliente}, class => "w3-margin-right w3-text-white w3-right");
        $writer->endTag('div');
        $writer->endTag('div');
        $writer->endTag('div');
    }
}

$writer->endTag('resultado');
$writer->end();

$sth->finish();
$dbh->disconnect;
#print $query->header('text/xml'), $fetch;
print $fetch;
