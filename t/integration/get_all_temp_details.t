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

my $url = $conf{'get_all_temperatures_url'};

my %data = (
    'Kitchen' => 1,
    'Garage' => 1,
    'Living room' => 1,

);

T::WebService::create_get_request(\%data, $url);
