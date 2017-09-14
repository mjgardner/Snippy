use utf8;

package WebApp::Snippy::Schema::Result::Note;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("notes");
__PACKAGE__->add_columns(
    "id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "note",
    { data_type => "text", is_nullable => 1 },
    "source",
    { data_type => "text", is_nullable => 1 },
    "created",
    { data_type => "datetime", is_nullable => 1, set_on_create => 1 },
    "updated",
    {   data_type     => "datetime",
        is_nullable   => 1,
        set_on_create => 1,
        set_on_update => 1,
    },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-09-14 12:28:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0OTance9Xg7JHdAlROUDFw

# You can replace this text with custom code or comments, and it will be preserved on regeneration
# ABSTRACT: Result set for notes stored in the database
# VERSION

1;

__END__

=head1 SYNOPSIS

    use WebApp::Snippy::Schema;
    my $schema = WebApp::Snippy::Schema->connect('dbi:SQLite:snippy.db');
    my @all_notes = $schema->resultset('Notes')->all;

=head1 DESCRIPTION

This class enables access to the C<notes> table in
L<WebApp::Snippy::Schema|WebApp::Snippy::Schema>.

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime|DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp|DBIx::Class::TimeStamp>

=back

=attr id

Auto-incrementing integer primary key for the table.

=attr note

Text of the note. Can be undef.

=attr source

Source attribution of the note, usually a URL. Can be undef.

=attr created

L<DateTime|DateTime> when the note was created. Can be undef. Set
automatically on record creation.

=attr updated

L<DateTime|DateTime> when the note was updated. Can be undef. Set
automatically on record creation and update.
