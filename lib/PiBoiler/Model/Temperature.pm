package PiBoiler::Model::Temperature;

use strict;
use warnings;

use PiBoiler::Connect;

my $dbh = PiBoiler::Connect::dbconnect();

my $create_temperature_sql = "INSERT INTO temperature SET timestamp=?, temperature=?, sensor_id=?, room_id=?";
my $create_temperature_sth = $dbh->prepare($create_temperature_sql);

my $query_temperature_sql = "SELECT timestamp, temperature FROM temperature where room_id=?";
my $query_temperature_sth = $dbh->prepare($query_temperature_sql);

my $query_all_temperature_sql = "SELECT t.timestamp, t.temperature, tp.description, dp.start_time, dp.end_time, dp.day, dp.target_temperature  FROM temperature t, temperature_plan tp, day_part dp where room_id=?";
my $query_all_temperature_sth = $dbh->prepare($query_all_temperature_sql);

sub create_temperature {
    my $temperature = shift;
    my $date_time = shift;
    my $sensor_id = shift;
    my $room_id = shift;

    $create_temperature_sth->execute($date_time, $temperature, $sensor_id, $room_id);

    my $id = $create_temperature_sth->(mysql_insertid);
    my $error;

    unless($id) {
            $error = "Cannot Add Temperature";
    }

    return ($id, $error);
}


sub query_temperature_details {
    my $room_id = shift;

    $query_temperature_sth->execute($room_id);

    my ($timestamp, $temperature) = $query_temperature_sth->fetchrow_array();

    my $error;

    unless($timestamp and $temperature) {
        $error = "Could not get temperature details";
    }

    my %data_ref = (
        'timestamp' => $timestamp,
        'temperature' => $temperature,
    );

    return (\%data_ref, $error);
}

sub query_temperature_details {
    my $room_id = shift;

    $query_temperature_sth->execute($room_id);

    my ($timestamp, $temperature) = $query_temperature_sth->fetchrow_array();

    my $error;

    unless($timestamp and $temperature) {
        $error = "Could not get temperature details";
    }

    my %data_ref = (
        'timestamp' => $timestamp,
        'temperature' => $temperature,
    );

    return (\%data_ref, $error);
}

sub query_all_temperature_details {
    my $room_id = shift;

    $query_all_temperature_sth->execute($room_id);

    my $temperature_info = $query_temperature_sth->fetchrow_hashref();

    my $error;

    unless($temperature_info) {
        $error = "Could not get temperature details";
    }

    return (\temperature_info, $error);
}

1;
