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
my $nombre = $query->param("nombre");
my $apellidoP = $query->param("apellidoP");
my $apellidoM = $query->param("apellidoM");
my $correo = $query->param("correo");
my $celular = $query->param("celular");
my $idCliente = $query->param("idCliente");

# la sección de acceso a Mysql
# Documentación en:
# https://metacpan.org/pod/DBD::mysql
my $dbh = conectar();
# Realizar el query sql
my $sth = $dbh->prepare("UPDATE Cliente SET nombre=?,apellidoP=?,apellidoM=?,correo=?,celular=? WHERE idCliente=?");
$sth->execute($nombre,$apellidoP,$apellidoM,$correo,$celular,$idCliente) or die $DBI::errstr;

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
    $writer->dataElement('titulo', 'Cliente actualizado');
    $writer->dataElement('contenido', 'La informacion del cliente fue actualizada');
} else {
    $writer->dataElement('titulo', 'Error de conexion');
    $writer->dataElement('contenido', 'No se pudo actualizar la informacion del cliente');
}

print $query->header('text/xml'), $fetch;

$writer->endTag('resultado');
$writer->end();

$sth->finish();
$dbh->disconnect;