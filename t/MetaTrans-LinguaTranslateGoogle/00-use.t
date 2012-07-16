# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 2;

BEGIN {

	# Test.
	use_ok('MetaTrans::LinguaTranslateGoogle');
}

# Test.
require_ok('MetaTrans::LinguaTranslateGoogle');
