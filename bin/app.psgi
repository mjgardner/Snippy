#!/usr/bin/env perl

# PODNAME: app.psgi

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";

use WebApp::Snippy;

WebApp::Snippy->to_app;
