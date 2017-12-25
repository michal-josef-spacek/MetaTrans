use strict;
use warnings;

use MetaTrans::Base;
use Test::More 'tests' => 5;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $ret = $obj->timeout;
is($ret, '5', 'Default timeout.');

# Test.
$ret = $obj->timeout(6);
is($ret, '5', 'After set timeout.');

# Test.
$ret = $obj->timeout;
is($ret, '6', 'Another get of timeout.');

# Test.
# XXX Isn't good.
$obj->timeout('foo');
$ret = $obj->timeout;
is($ret, 'foo', 'Get of bad timeout.');
