#!/usr/bin/env perl

print "Content-type: text/html\n\n";

# Se crea un paquete
package Conexion;

use strict;

# Módulos para desplegar errores
use CGI;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);
use warnings;
use diagnostics;

# Interfaz DB, particularmente driver mysql
# Documentación DBI:
# https://metacpan.org/pod/DBI
# http://www.perltutorial.org/perl-dbi/
use DBI;
use DBD::mysql;

# Se exportan variables y funciones del módulo
use Exporter;
#use base qw(Exporter);
# permite asociar el paquete declarado por el alumno como 'parte' del
# modulo Exporter, en término de POO se diría que el módulo 
# 'conexion' es una subclase de Exporter
our @ISA = qw(Exporter);
# las variables y funciones se exportan a través del arreglo @EXPORT
# es decir aqui se declaran todas las funciones que se deseen
our @EXPORT = qw (conectar);

sub conectar{
    #Definicion de variables
    my $BD = "Inmobiliaria";
    my $host = "localhost";
    my $puerto = "3306";
    my $user = "root";
    my $pwd = "12345";
    
    # Declarar cadena de conexion
    my $dsn = "dbi:mysql:$BD:$host:$puerto";

    #Abrir una conexion
    my $dbh = DBI->connect($dsn, $user, $pwd) or die "Error de conexión: $DBI::errstr\n";

    return $dbh;
}