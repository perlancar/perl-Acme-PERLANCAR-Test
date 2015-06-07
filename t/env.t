#!perl

use 5.010001;
use strict;
use warnings;

use Test::More 0.98;

# investigating failures in recent Data-Sah, i'm testing that windows/strawberry
# perl can temporarily set ENV var

plan skip_all => "FOO_BAR is set???" if $ENV{FOO_BAR};

ok(!$ENV{FOO_BAR});
{
    local $ENV{FOO_BAR} = 1;
    ok($ENV{FOO_BAR}) or diag explain \%ENV;
}
ok(!$ENV{FOO_BAR}) or diag explain \%ENV;

done_testing;
