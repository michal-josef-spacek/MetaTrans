# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::SlovnikCz;
use Test::More 'tests' => 1;

# Test.
is($MetaTrans::SlovnikCz::VERSION, 1.06, 'Version.');
