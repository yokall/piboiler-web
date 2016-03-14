package PiBoilerWeb::Controller::Rooms;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

use PiBoilerWeb::Model::Rooms;

sub add {
    my $self = shift;

    warn "WARN";
}

sub add_post {
    my $self = shift;

    warn "POST";

    my $params = $self->req->params->to_hash();
    warn Dumper($params);

    return $self->redirect_to('/');
}

sub delete {

}

sub edit {
    my $self = shift;

    my $id = $self->param('id');
}

1;
