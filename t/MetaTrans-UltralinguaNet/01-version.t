# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::UltralinguaNet;
use Test::More 'tests' => 1;

# Test.
is($MetaTrans::UltralinguaNet::VERSION, 1.06, 'Version.');
