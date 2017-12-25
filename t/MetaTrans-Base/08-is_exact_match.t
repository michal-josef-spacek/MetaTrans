use strict;
use warnings;

use English;
use MetaTrans::Base qw(is_exact_match);
use Test::More 'tests' => 7;
use Test::NoWarnings;

# Test.
my $old = $SIG{'__WARN__'};
$SIG{'__WARN__'} = sub { die $_[0]; };
# XXX Remove this warning.
eval {
	is_exact_match();
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^Use of uninitialized value \$expr in substitution},
	'No expressions.');

# Test.
$SIG{'__WARN__'} = sub { die $_[0]; };
# XXX Remove this warning.
eval {
	is_exact_match('foo');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^Use of uninitialized value \$expr in substitution},
	'Only one expression.');

# Test.
my $ret = is_exact_match('foo', 'foo');
is($ret, 1, 'Same expressions.');

# Test.
$ret = is_exact_match('foo', 'bar');
is($ret, '', 'Different expressions.');

# Test.
$ret = is_exact_match('FOo', 'foo');
is($ret, 1, 'Same expressions if one is upper case and other lower case.');

# Test.
$ret = is_exact_match('foo', '(foo)foo(bar)');
is($ret, 1, 'Advanced match with strip_grammar_info() inputs.');
