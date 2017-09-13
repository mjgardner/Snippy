{   schema_class   => 'WebApp::Snippy::Schema',
    lib            => './lib',
    connect_info   => { dsn => 'dbi:SQLite:./snippy.db' },
    loader_options => {
        dump_directory        => './lib',
        filter_generated_code => 'perltidy --profile=xt/author/perltidy.rc',
        components            => [qw(InflateColumn::DateTime TimeStamp)],
        custom_column_info    => sub {
            my ( $table, $column_name, $column_info ) = @_;

            for ($column_name) {
                $_ eq 'created' and return {
                    data_type     => 'datetime',
                    set_on_create => 1,
                };
                $_ eq 'updated' and return {
                    data_type     => 'datetime',
                    set_on_create => 1,
                    set_on_update => 1,
                };
            }
        },
    },
}
