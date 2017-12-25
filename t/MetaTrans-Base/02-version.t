use strict;
use warnings;

use MetaTrans::Base;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::Base::VERSION, 1.06, 'Version.');
