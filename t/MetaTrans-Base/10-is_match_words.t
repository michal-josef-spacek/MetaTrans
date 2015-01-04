# Pragmas.
use strict;
use warnings;

# Modules.
use English;
use MetaTrans::Base qw(is_match_words);
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $old = $SIG{'__WARN__'};
$SIG{'__WARN__'} = sub { die $_[0]; };
# XXX Remove this warning.
eval {
	is_match_words();
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^Use of uninitialized value \$expr in substitution},
	'No expressions.');

# Test.
$SIG{'__WARN__'} = sub { die $_[0]; };
# XXX Remove this warning.
eval {
	is_match_words('foo');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^Use of uninitialized value \$expr in substitution},
	'No second expression.');

# Test.
my $ret = is_match_words('foo', 'foo');
is($ret, 1, 'Match word in same word.');

# Test.
$ret = is_match_words('foo', 'bar baz');
is($ret, undef, 'Not match word in more other words.');

# Test.
$ret = is_match_words('foo', 'bar foo baz');
is($ret, 1, 'Match word in more words.');

# TODO $at_bounds
