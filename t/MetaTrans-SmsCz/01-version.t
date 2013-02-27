# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::SmsCz;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::SmsCz::VERSION, 1.06, 'Version.');
