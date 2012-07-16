# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans;
use Test::More 'tests' => 1;

# Test.
is($MetaTrans::VERSION, 1.06, 'Version.');
