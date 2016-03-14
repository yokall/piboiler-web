package PiBoilerWeb;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;

  $self->secrets(['Mojolicious rocks']);

  push @{$self->static->paths}, '/sites/pi_boiler/docs';

  my $r = $self->routes;
  $r->any('/')->to('index#index');

  $r->get('/add_room')->to('rooms#add');
  $r->post('/add_room')->to('rooms#add_post');

  $r->get('/edit/:id')->to('rooms#edit');
  $r->post('/edit/:id')->to('rooms#edit_post');

  $r->get('/delete/:id')->to('rooms#delete');

}

1;
