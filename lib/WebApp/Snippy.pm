package WebApp::Snippy;

# ABSTRACT: minimalist note-taking web application

=head1 DESCRIPTION

This web application was developed as a CAP499 Capstone Project for
L<Independence University|http://independence.edu/>. It demonstrates a
minimal CRUD (create, report, update, delete) interface to a database
table accessed via L<DBIx::Class|DBIx::Class>.

=head1 SYNOPSIS

    use WebApp::Snippy;
    WebApp::Snippy->to_app;

=cut

use strict;
use warnings;
use utf8;
use Dancer2;
use Dancer2::Plugin::DBIC;

# VERSION

get '/:id?' => sub {
    my $id      = route_parameters->get('id');
    my $query   = query_parameters->get('query');
    my $note_rs = resultset('Note');

    my @results
        = $id ? $note_rs->find( { id => $id } )
        : length $query ? $note_rs->search(
        {   -or => [
                note   => { like => "%$query%" },
                source => { like => "%$query%" },
            ],
        },
        )
        : $note_rs->all;
    redirect q{/} if not ref $results[0];

    template index => {
        ( id => $id ) x !!$id,
        query   => $query,
        results => [ map { ( { _result_fields($_) } ) } @results, ],
    };
};

post '/:id?' => sub {
    my $id      = route_parameters->get('id');
    my %post    = map { $_ => body_parameters->get($_) } qw(note source);
    my $note_rs = resultset('Note');

    if ($id) {
        my $note = $note_rs->find( { id => $id } );
        redirect q{/} if not $note;

        if ( body_parameters->get('delete') ) {
            $note->delete();
            redirect q{/};
        }
        else { $note->update( \%post ) }
    }
    else {
        my $result = $note_rs->create( \%post );
        $id = $result->get_column('id');
    }
    redirect "/$id";
};

## no critic (Subroutines::RequireArgUnpacking)
sub _result_fields {
    return map { $_ => $_[0]->$_ } qw(id note source created updated);
}

1;
