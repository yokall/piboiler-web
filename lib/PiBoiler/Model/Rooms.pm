package PiBoiler::Model::Rooms;

use PiBoiler::Connect;

my $dbh = PiBoiler::Connect::dbconnect();

my $query_room_id_sql = "SELECT _id FROM room WHERE sensor_id=?";
my $query_room_id_sth = $dbh->prepare($query_room_id_sql);

my $create_room_sql = "INSERT INTO room SET room_name=?, sensor_id=?";
my $create_room_sth = $dbh->prepare($create_room_sql);

sub create_room {
    my $room_name = shift;
    my $sensor_id = shift;

    $create_room_sth->execute($room_name, $sensor_id);

    my $id = mysql_insert_id();

    my $error;

    unless($id) {
        $error = "Cannot Add Room";
    }


    return ($id, $error);
}

sub query_room {
    my $sensor_id = shift;

    $query_room_id_sth->execute($sensor_id);

    my $room_id = $query_room_id_sth->fetchrow_array();

    my $error;

    unless($room_id) {
        $error = "Cannot Find Room for $sensor_id";
    }

    return ($room_id, $error);
}
1;
