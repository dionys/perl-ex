#!/usr/bin/env perl -w

use strict;
use Test::More;
use lib::abs "../lib";
BEGIN {
	my $lib = lib::abs::path( ".." );
	chdir $lib or plan skip_all => "Can't chdir to dist $lib";
}

$ENV{TEST_AUTHOR} or plan skip_all => '$ENV{TEST_AUTHOR} not set';
# Ensure a recent version of Test::Pod::Coverage
eval "use Test::Pod::Coverage 1.08; 1"
	or plan skip_all => "Test::Pod::Coverage 1.08 required for testing POD coverage";
eval "use Pod::Coverage 0.18; 1"
	or plan skip_all => "Pod::Coverage 0.18 required for testing POD coverage";

all_pod_coverage_ok();
exit 0;
require Test::Pod::Coverage; # ;)
require Test::NoWarnings;
