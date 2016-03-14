package PiBoiler::Model::Temperature;

use strict;
use warnings;
use Data::Dumper;
use PiBoiler::Connect;

my $dbh = PiBoiler::Connect::dbconnect();

my $create_temperature_sql = "INSERT INTO temperature SET timestamp=?, temperature=?, room_id=?";
my $create_temperature_sth = $dbh->prepare($create_temperature_sql);

my $query_temperature_sql = "SELECT timestamp, temperature FROM temperature where room_id=?";
my $query_temperature_sth = $dbh->prepare($query_temperature_sql);

my $query_all_temperature_sql = "SELECT t.timestamp, t.temperature, tp.description, dp.start_time, dp.day_name, dp.target_temperature FROM temperature t, temperature_plan tp, day_part dp where t.room_id=? and t.room_id=tp.room_id";
my $query_all_temperature_sth = $dbh->prepare($query_all_temperature_sql);

sub create_temperature {
    my $temperature = shift;
    my $date_time = shift;
    my $room_id = shift;

    warn "Room id $room_id";

    $create_temperature_sth->execute($date_time, $temperature, $room_id);

    my $id = $create_temperature_sth->{mysql_insertid};
    my $error;

    unless($id) {
            $error = "Cannot Add Temperature";
    }

    return ($id, $error);
}


sub query_temperature_details {
    my $room_id = shift;

    $query_temperature_sth->execute($room_id);

    my $data_ref = $query_temperature_sth->fetchrow_hashref();

    warn Dumper($data_ref);

    my $error;

    unless($data_ref) {
        $error = "Could not get temperature details";
    }

    return ($data_ref, $error);
}

sub query_all_temperature_details {
    my $room_id = shift;

    $query_all_temperature_sth->execute($room_id);

    my $temperature_info = $query_all_temperature_sth->fetchrow_hashref();

    my $error;

    unless($temperature_info) {
        $error = "Could not get temperature details";
    }

    return ($temperature_info, $error);
}

1;
