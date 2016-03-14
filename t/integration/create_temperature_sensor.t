#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use lib '/sites/pi_boiler/t/lib';

use T::Conf;
use T::WebService;
use Data::Dumper;

my $confref = T::Conf::get_variables();
my %conf = %$confref;

my $url = $conf{'create_temp_sensor_url'};

my %data = (
    'temp' => '17',
    'date_time' => '2016-04-01 09:00:00',
    'sensor_id' => 'TA',
);

T::WebService::create_post_request(\%data, $url);


my %data = (
    'temp' => '20',
    'date_time' => '2016-04-01 10:00:00',
    'sensor_id' => 'TB',
);

T::WebService::create_post_request(\%data, $url);

my %data = (
    'temp' => '15',
    'date_time' => '2016-04-01 10:00:00',
    'sensor_id' => 'TZ',
);

T::WebService::create_post_request(\%data, $url);