# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::Base;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
isa_ok($obj, 'MetaTrans::Base');

# Test.
is_deeply(
	$obj,
	{
		'host_server' => 'unknown.server',
		'match_at_bounds' => 1,
		'matching' => 2,
		'script_name' => undef,
		'timeout' => 5,
	},
	'Constructor with default values.',
);

# Test.
$obj = MetaTrans::Base->new(
	'host_server' => 'foo.bar',
	'match_at_bounds' => 0,
	'matching' => 1,
	'script_name' => 'foo.pl',
	'timeout' => 1,
);
is_deeply(
	$obj,
	{
		'host_server' => 'foo.bar',
		'match_at_bounds' => 0,
		'matching' => 1,
		'script_name' => 'foo.pl',
		'timeout' => 1,
	},
	'Constructor with my values.',
);
