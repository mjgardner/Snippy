package WebApp::Snippy;

# ABSTRACT: minimalist note-taking web application

use Dancer2;
use Dancer2::Plugin::DBIC;

our $VERSION = '0.1';

get '/:id?' => sub {
    my $id      = route_parameters->get('id');
    my $query   = query_parameters->get('query');
    my $note_rs = resultset('Note');

    my @results = $id           ? $note_rs->find( {id => $id} )
                : length $query ? $note_rs->search( {
                                        -or => [
                                            note   => {like => "%$query%"},
                                            source => {like => "%$query%"},
                                        ],
                                    } )
                :                 $note_rs->all;
    redirect '/' if not ref $results[0];

    template index => {
        (id => $id) x !!$id,
        query   => $query,
        results => [map { { _result_fields($_) } } @results],
    };
};

post '/:id?' => sub {
    my $id      = route_parameters->get('id');
    my %post    = map { $_ => body_parameters->get($_) } qw(note source);
    my $note_rs = resultset('Note');

    if ($id) {
        my $note = $note_rs->find( {id => $id} );
        redirect '/' if not $note;

        if ( body_parameters->get('delete') ) {
            $note->delete();
            redirect '/';
        }
        else { $note->update(\%post) }
    }
    else {
        my $result = $note_rs->create(\%post);
        $id = $result->get_column('id');
    }
    redirect "/$id";
};

sub _result_fields {
    return map {$_ => $_[0]->$_} qw(id note source created updated);
}

true;
