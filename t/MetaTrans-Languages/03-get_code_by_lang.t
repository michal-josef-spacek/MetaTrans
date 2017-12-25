use strict;
use warnings;

use MetaTrans::Languages qw(get_code_by_lang);
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $ret = get_code_by_lang('Afrikaans');
is($ret, 'afr', "Convert code 'Afrikaans' to lang 'afr'.");
