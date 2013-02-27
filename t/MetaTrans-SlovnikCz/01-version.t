# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::SlovnikCz;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::SlovnikCz::VERSION, 1.06, 'Version.');
