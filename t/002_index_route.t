use strict;
use warnings;

use WebApp::Snippy;
use Test::More tests => 1;
use Plack::Test;
use HTTP::Request::Common;

my $app = WebApp::Snippy->to_app;
is ref $app, 'CODE', 'Got app';
