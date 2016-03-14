package T::XMLUtilities;

use strict;
use warnings;

use Test::More;
use XML::LibXML;

use T::Conf;
use XML::Compare;

my $confref = T::Conf::get_variables();
my %conf = %$confref;

my $template_dir = $conf{'template_dir'};

sub parse_string_to_xml_doc {
	my $xml = shift;

	my $parser = XML::LibXML->new();
	my $response_doc = eval { $parser->parse_string($xml); };
	if ($@) {
		warn "XML Parse Error: $@";
		return 0;
	}

	return $response_doc;
}

sub check_web_service_response {
	my $service = shift;
    my $expected_file_path = shift;
    my $response = shift;
    my $error = shift;

    if ($error) {
        ok(0, "$service Web service call error: $error");
    }
    else {
        my $expected = T::FileUtilities::get_file_content($template_dir.'/Responses/'.$expected_file_path);

        my ($aSorted, $xSorted, $result, @errorList) = XML::Compare::File($expected, $response);

        is($result, 'match', "$service response as expected!");

        unless ($result eq 'match') {
            warn "Actual:";
            warn $response."\n\n";
            warn "Expected:";
            warn $expected."\n\n";

            foreach my $error (@errorList) {
                warn $error;
            }
        }
    }
}

1;
