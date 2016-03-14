package PiBoiler::Model::Temperature;

use strict;
use warnings;

use PiBoiler::Connect;

my $dbh = PiBoiler::Connect::dbconnect();

my $create_temperature_sql = "INSERT INTO temperature SET timestamp=?, temperature=?, sensor_id=?, room_id=?";
my $create_temperature_sth = $dbh->prepare($create_temperature_sql);

sub create_temperature {
    my $temperature = shift;
    my $date_time = shift;
    my $sensor_id = shift;
    my $room_id = shift;

    $create_temperature_sth->execute($date_time, $temperature, $sensor_id, $room_id);

    my $id = mysql_insert_id();
    my $error;

    unless($id) {
            $error = "Cannot Add Temperature";
    }

    return ($id, $error);
}

1;
