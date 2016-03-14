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
    my $result = PiBoilerWeb::Model::Rooms::add($params);

    return $self->redirect_to('/');
}

sub delete {
    my $self = shift;

    my $id = $self->param('id');

    my $result = PiBoilerWeb::Model::Rooms::delete($id);
}

sub edit {
    my $self = shift;

    my $id = $self->param('id');

    $self->stash(id => $self->param('id') || '');
    $self->stash(id => $self->param('room_name') || '');
    $self->stash(id => $self->param('sensor_id') || '');

}

1;
