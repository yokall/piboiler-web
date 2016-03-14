package PiBoilerWeb::Controller::Index;
use Mojo::Base 'Mojolicious::Controller';

sub index {
    my $self = shift;

    $self->stash(room_data => $self->param('room_data') || '');

    warn "INDEX";
}

1;
