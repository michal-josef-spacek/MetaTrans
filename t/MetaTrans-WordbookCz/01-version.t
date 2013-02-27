# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::WordbookCz;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::WordbookCz::VERSION, 1.06, 'Version.');
