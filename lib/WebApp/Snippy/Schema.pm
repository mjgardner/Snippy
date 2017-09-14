use utf8;

package WebApp::Snippy::Schema;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-09-14 12:28:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dVJJ2bN89e3A7BkhVhngUg

# You can replace this text with custom code or comments, and it will be preserved on regeneration
# ABSTRACT: Database schema for WebApp::Snippy
# VERSION

1;

__END__

=head1 SYNOPSIS

    use WebApp::Snippy::Schema;
    my $schema = WebApp::Snippy::Schema->connect('dbi:SQLite:snippy.db');
    my @all_notes = $schema->resultset('Notes')->all;

=head1 DESCRIPTION

This class enables access to the database schema used by
L<WebApp::Snippy|WebApp::Snippy>.

