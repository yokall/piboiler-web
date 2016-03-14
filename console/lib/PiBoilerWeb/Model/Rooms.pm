package PiBoilerWeb::Model::Rooms;

use strict;
use warnings;
use XML::XML2JSON;

use lib '/sites/pi_boiler/lib';

use PiBoiler::Model::Rooms;

sub add {
    my $params = shift;

    my $sensor_id = $params->{'sensor_id'};
    my $room_name = $params->{'room_name'};

    my $result = PiBoiler::Model::Rooms::create_room($room_name, $sensor_id);

    return $result;
}

sub edit {
    my $params = shift;

}

sub delete {
    my $id = shift;

}

1;
