package PiBoiler::Connect;

use PiBoiler::Conf;
use DBI;

sub dbconnect {
    my $dbh = DBI->connect('DBI:mysql:pi_boiler', 'pi', 'boiler'
    	           ) || die "Could not connect to database: $DBI::errstr";
                   warn "DBH $dbh";
    return $dbh;
}
1;
