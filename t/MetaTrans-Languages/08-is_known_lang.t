# Pragmas.
use strict;
use warnings;

# Modules.
use MetaTrans::Languages qw(is_known_lang);
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $ret = is_known_lang('afr');
is($ret, 1, "Known 'afr' language.");

# Test.
$ret = is_known_lang('foo');
is($ret, '', "Unknown 'foo' language.");
