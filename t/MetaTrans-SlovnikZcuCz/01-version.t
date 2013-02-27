# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::SlovnikZcuCz;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::SlovnikZcuCz::VERSION, 1.06, 'Version.');
