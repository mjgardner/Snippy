#!/usr/bin/env perl

# ABSTRACT: minimalist note-taking web application
# PODNAME: snippy.psgi

package main;

use strict;
use warnings;
use utf8;

# VERSION
use FindBin;
use lib "$FindBin::Bin/../lib";

use WebApp::Snippy;

=head1 USAGE

    plackup -r bin/snippy.psgi

=head1 OPTIONS

None.

=head1 EXIT STATUS

See L<plackup|plackup> or your favorite PSGI runner.

=cut

WebApp::Snippy->to_app;
