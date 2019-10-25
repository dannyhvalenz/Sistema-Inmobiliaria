#!"\ActivePerl\perl\bin\perl.exe"
use strict;
use warnings;
use diagnostics;
use CGI;

# módulo para desplegar errores
use CGI::Carp qw(warningsToBrowser fatalsToBrowser);

# indicar de donde cargar un módulo adhoc para manejo de BD
use lib ("c:\xampp\cgi-bin\salulife");
# se carga nuestro paquete nuevo
use Conexion;

$query = CGI::new();
$usuario = $query->param("usuario");
$contrasena = $query->param("contrasena");
$nombre = $query->param("nombre");
$apellidopat = $query->param("apellidopat");
$apellidomat = $query->param("apellidomat");

# la sección de acceso a Mysql
# Documentación en:
# https://metacpan.org/pod/DBD::mysql
my $dbh = conectar();
# Realizar el query sql
$sth = $dbh->prepare("insert into administrador (Usuario, Contrasena, Nombre, Apellido_pat, Apellido_mat) values (?,?,?,?,?)");
$sth->execute($usuario, $contrasena, $nombre, $apellidopat, $apellidomat) or die $DBI::errstr;

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
        $writer->dataElement('titulo', 'Nuevo administrador en el sistema');
        $writer->dataElement('contenido', 'Ahora existe un nuevo administrador del sistema');
}

$writer->endTag('resultado');
$writer->end();

$sth->finish();
$dbh->disconnect;
print $query->header('text/xml'), $fetch;
