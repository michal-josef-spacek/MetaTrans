use strict;
use warnings;

use English qw(-no_match_vars);
use MetaTrans::Base;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $old = $SIG{'__WARN__'};
$SIG{'__WARN__'} = sub {};
$obj->set_languages('eng', 'foo', 'fre');
is_deeply(
	$obj,
	{
		'host_server' => 'unknown.server',
		'languages' => {
			'eng' => 'English',
			'fre' => 'French',
		},
		'language_keys' => [
			'eng',
			'fre',
		],
		'match_at_bounds' => 1,
		'matching' => 2,
		'script_name' => undef,
		'timeout' => 5,
	},
	'Add two known and one unknown languages.',
);
$SIG{'__WARN__'} = $old;

# Test.
$SIG{'__WARN__'} = sub { die $_[0]; };
eval {
	$obj->set_languages('foo');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^unknown language code: 'foo', ignoring it},
	'Test warning with unknown language.');
