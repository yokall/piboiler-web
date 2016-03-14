package PiBoilerWeb::Controller::Index;
use Mojo::Base 'Mojolicious::Controller';

sub index {
    my $self = shift;

    return $self->render;
}

1;
