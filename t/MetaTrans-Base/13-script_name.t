use strict;
use warnings;

use MetaTrans::Base;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $ret = $obj->script_name;
is($ret, undef, 'Default script name.');

# Test.
$ret = $obj->script_name('foo.pl');
is($ret, undef, 'After set script name.');

# Test.
$ret = $obj->script_name;
is($ret, 'foo.pl', 'Another get script name.');
