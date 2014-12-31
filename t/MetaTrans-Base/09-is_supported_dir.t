# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::Base;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $ret = $obj->is_supported_dir('cze', 'ger');
is($ret, undef, 'Unknown direction.');

# Test.
$obj->set_languages('cze', 'ger');
$obj->set_dir_1_to_spec('cze', 'ger');
$ret = $obj->is_supported_dir('cze', 'ger');
is($ret, 1, "Direction 'cze' -> 'ger'.");

# Test.
$ret = $obj->is_supported_dir('ger', 'cze');
is($ret, undef, "Unknown direction 'ger' -> 'cze'.");
