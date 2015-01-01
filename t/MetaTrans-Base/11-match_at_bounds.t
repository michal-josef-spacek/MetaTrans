# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::Base;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $ret = $obj->match_at_bounds;
is($ret, '1', 'Default match at bounds.');

# Test.
$ret = $obj->match_at_bounds(0);
is($ret, '1', 'After set match at bounds.');

# Test.
$ret = $obj->match_at_bounds;
is($ret, '0', 'Another get of match at bounds.');

# Test.
# XXX Isn't good.
$obj->match_at_bounds('foo');
$ret = $obj->match_at_bounds;
is($ret, 'foo', 'Get of bad match at bounds.');
