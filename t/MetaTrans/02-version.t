use strict;
use warnings;

use MetaTrans;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::VERSION, 1.06, 'Version.');
