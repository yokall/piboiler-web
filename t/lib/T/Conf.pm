package T::Conf;

my $host_name = "piboiler.com";

sub get_variables {
	my %conf = (
		'create_room_url' => "http://$host_name/cgi-bin/pi_boiler/api/create_room",
	);

	return \%conf;
}

1;
