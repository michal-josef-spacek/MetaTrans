# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::LinguaTranslateGoogle;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($MetaTrans::LinguaTranslateGoogle::VERSION, 1.06, 'Version.');
