# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::Base;
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $expr = 'foo ';
my $ret = MetaTrans::Base::strip_grammar_info($expr);
is($ret, 'foo', 'Remove last space in expresion.');

# Test.
$expr = ' foo';
$ret = MetaTrans::Base::strip_grammar_info($expr);
is($ret, 'foo', 'Remove first space in expresion.');

# Test.
$expr = 'foo;bar';
$ret = MetaTrans::Base::strip_grammar_info($expr);
is($ret, 'foo', "Remove expression after ';'.");

# Test.
$expr = '(bar)foo(baz)';
$ret = MetaTrans::Base::strip_grammar_info($expr);
is($ret, 'foo', 'Remove everything in parantheses.');

# Test.
$expr = '+foo-';
$ret = MetaTrans::Base::strip_grammar_info($expr);
is($ret, 'foo', 'Substitute no word strings to spaces and remove first '.
	'and last space.');
