use strict;
use warnings;

use MetaTrans::Languages qw(get_lang_by_code);
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $ret = get_lang_by_code('afr');
is($ret, 'Afrikaans', "Convert lang 'afr' to code 'Afrikaans'.");
