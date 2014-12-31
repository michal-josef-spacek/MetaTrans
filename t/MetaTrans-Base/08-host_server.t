# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::Base;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $ret = $obj->host_server;
is($ret, 'unknown.server', 'Default host server.');

# Test.
$ret = $obj->host_server('Foo');
is($ret, 'unknown.server', 'After set host server.');

# Test.
$ret = $obj->host_server;
is($ret, 'Foo', 'Another get host server.');
