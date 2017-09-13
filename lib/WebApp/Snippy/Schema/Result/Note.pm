use utf8;

package WebApp::Snippy::Schema::Result::Note;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

WebApp::Snippy::Schema::Result::Note

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );

=head1 TABLE: C<notes>

=cut

__PACKAGE__->table("notes");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 note

  data_type: 'text'
  is_nullable: 1

=head2 source

  data_type: 'text'
  is_nullable: 1

=head2 created

  data_type: 'datetime'
  is_nullable: 1
  set_on_create: 1

=head2 updated

  data_type: 'datetime'
  is_nullable: 1
  set_on_create: 1
  set_on_update: 1

=cut

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

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2017-09-13 12:24:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MtVk2UudlmIATWg6GLG+ew


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
