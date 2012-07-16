# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::Base;
use Test::More 'tests' => 1;

# Test.
is($MetaTrans::Base::VERSION, 1.06, 'Version.');
