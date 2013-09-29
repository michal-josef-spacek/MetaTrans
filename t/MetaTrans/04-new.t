# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans->new;
isa_ok($obj, 'MetaTrans');

# Test.
is_deeply(
	$obj,
	{},
	'Constructor with default values.',
);

# Test.
$obj = MetaTrans->new('Foo', 'Bar');
is_deeply(
	$obj,
	{
		'enabled' => {
			'Bar' => 1,
			'Foo' => 1,
		},
		'translators' => [
			'Foo',
			'Bar',
		],
	},
	'Constructor with two translators.',
);
