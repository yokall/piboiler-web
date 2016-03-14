package PiBoilerWeb::Controller::Rooms;
use Mojo::Base 'Mojolicious::Controller';

sub add {
    my $self = shift;
}

sub add_post {
    my $self = shift;

    return $self->redirect_to('/');
}

1;
