# Pragmas.
use strict;
use warnings;

# Modules.
use English qw(-no_match_vars);
use MetaTrans::Base qw(M_START);
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $ret = $obj->matching;
is($ret, 2, 'Default matching value.');

# Test.
$ret = $obj->matching(1);
is($ret, 2, 'Get matching when set new matching value.');

# Test.
$ret = $obj->matching;
is($ret, 1, 'Another get.');

# Test.
$obj->matching(M_START);
$ret = $obj->matching;
is($ret, 2, 'Get after set to M_START value.');

# Test.
my $old = $SIG{'__WARN__'};
$SIG{'__WARN__'} = sub { die $_[0]; };
eval {
	$obj->matching('Foo');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^invalid matching type: 'Foo'}, 'Bad matching value.');
