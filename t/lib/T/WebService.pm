package T::WebService;

use strict;
use warnings;

use LWP::UserAgent;
use HTTP::Request;
use Mojo::UserAgent;

use Data::Dumper;

sub create_http_request {
	my $service_url = shift;
	my $soap_action = shift;
	my $message_content = shift;

	my $request = HTTP::Request->new(POST => $service_url);
	$request->header(SOAPAction => $soap_action);
	$request->content($message_content);
	$request->content_type("text/xml; charset=utf-8");

	return $request;
}

sub create_post_request {
	my $dataref = shift;
	my $url = shift;

	warn "URL - $url";
	warn Dumper($dataref);

	my $ua = Mojo::UserAgent->new;
	my $tx = $ua->post("$url" => json => $dataref);

	warn Dumper($tx);

	if (my $res = $tx->success) {
		warn $res->body
	}
	else {
	  my $err = $tx->error;
	  warn "$err->{code} response: $err->{message}" if $err->{code};
	  warn "Connection error: $err->{message}";
	}
}

sub create_get_request {
	my $dataref = shift;
	my $url = shift;

	warn "URL - $url";
	warn Dumper($dataref);

	my $ua = Mojo::UserAgent->new;
	my $tx = $ua->get("$url" => json => $dataref);

	warn Dumper($tx);

	if (my $res = $tx->success) {
		warn $res->body
	}
	else {
	  my $err = $tx->error;
	  warn "$err->{code} response: $err->{message}" if $err->{code};
	  warn "Connection error: $err->{message}";
	}
}

sub send_webservice_request {
	my $request = shift;

	my $userAgent = LWP::UserAgent->new();

	my $response = $userAgent->request($request);

	unless ($response->code == 200) {
		my $error = $response->error_as_HTML;

		return undef, $error;
	}
	else {
		my $response_as_string = $response->as_string;
		my ($http_header, $response_xml) = split /\n\n/, $response_as_string;

		if ($response_xml =~ /^ERROR/) {
			return undef, $response_xml;
		}

		return T::XMLUtilities::parse_string_to_xml_doc($response_xml);
	}
}

1;
