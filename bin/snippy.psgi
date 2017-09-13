#!/usr/bin/env perl

# ABSTRACT: minimalist note-taking web application
# PODNAME: snippy.psgi

use strict;
use warnings;
use utf8;

# VERSION
use FindBin;
use lib "$FindBin::Bin/../lib";

use WebApp::Snippy;

=head1 USAGE

    plackup -r bin/snippy.psgi

=cut

WebApp::Snippy->to_app;
