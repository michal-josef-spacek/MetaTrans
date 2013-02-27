# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::Base;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::Base::VERSION, 1.06, 'Version.');
