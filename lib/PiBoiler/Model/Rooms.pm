package PiBoiler::Model::Rooms;

use PiBoiler::Connect;

my $dbh = PiBoiler::Connect::dbconnect();

my $query_room_id_by_sensor_sql = "SELECT _id FROM room WHERE sensor_id=?";
my $query_room_id_by_sensor_sth = $dbh->prepare($query_room_id_by_sensor_sql);

my $query_room_id_by_name_sql = "SELECT _id FROM room WHERE room_name=?";
my $query_room_id_by_name_sth = $dbh->prepare($query_room_id_by_name_sql);

my $create_room_sql = "INSERT INTO room SET room_name=?, sensor_id=?";
my $create_room_sth = $dbh->prepare($create_room_sql);


sub create_room {
    my $room_name = shift;
    my $sensor_id = shift;

    $create_room_sth->execute($room_name, $sensor_id);

    my $id = $create_room_sth->(mysql_insertid);

    my $error;

    unless($id) {
        $error = "Cannot Add Room";
    }


    return ($id, $error);
}

sub query_room_by_sensor {
    my $sensor_id = shift;

    $query_room_id_by_sensor_sth->execute($sensor_id);

    my $room_id = $query_room_id_by_sensor_sth->fetchrow_array();

    my $error;

    unless($room_id) {
        $error = "Cannot Find Room for $sensor_id";
    }

    return ($room_id, $error);
}

sub query_room_by_name {
    my $room_name = shift;

    $query_room_id_by_name_sth->execute($room_name);

    my $room_id = $query_room_id_by_name_sth->fetchrow_array();

    my $error;

    unless($room_id) {
        $error = "Cannot Find Room for $room_name";
    }

    return ($room_id, $error);

}

1;
