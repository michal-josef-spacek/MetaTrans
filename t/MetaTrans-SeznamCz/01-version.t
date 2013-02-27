# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::SeznamCz;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::SeznamCz::VERSION, 1.06, 'Version.');
