package T::Conf;

my $host_name = "piboiler.com";

sub get_variables {
	my %conf = (
		'create_room_url' => "http://$host_name/cgi-bin/pi_boiler/api/create_room",
		'create_temp_sensor_url' => "http://$host_name/cgi-bin/pi_boiler/api/log_temperature",
		'get_temperature_url' => "http://$host_name/cgi-bin/pi_boiler/api/get_temperature",
		'get_all_temperatures_url' => "http://$host_name/cgi-bin/pi_boiler/api/get_all_rooms_details",
	);

	return \%conf;
}

1;
