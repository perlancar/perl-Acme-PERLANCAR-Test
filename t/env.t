#!perl

use 5.010001;
use strict;
use warnings;

use Test::More 0.98;

# investigating failures in recent Data-Sah, i'm suspecting that in some
# systems, we couldn't properly set ENV var like DATA_SAH_PP et al temporarily.
# UPDATE: doesn't seem to be the case, the test results are successful. btw,
# anyway, i'm switching from using ENV to using package globals in
# Data-Sah-0.62.

plan skip_all => "FOO_BAR is set???" if $ENV{FOO_BAR};

ok(!$ENV{FOO_BAR});
{
    local $ENV{FOO_BAR} = 1;
    ok($ENV{FOO_BAR}) or diag explain \%ENV;
}
ok(!$ENV{FOO_BAR}) or diag explain \%ENV;

done_testing;
