package PiBoilerWeb::Controller::Rooms;
use Mojo::Base 'Mojolicious::Controller';

sub add {
    my $self = shift;

    return $self->render;
}

sub add_post {
    my $self = shift;

    return $self->redirect_to('index');
}

1;
