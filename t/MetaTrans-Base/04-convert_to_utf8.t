use strict;
use warnings;

use Encode qw(decode_utf8);
use MetaTrans::Base qw(convert_to_utf8);
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
## 'ěščřžýáíé'
my $windows_1250_string = join '', map { chr } (0xEC, 0x9A, 0xE8, 0xF8, 0x9E,
	0xFD, 0xE1, 0xED, 0xE9);
my $ret = convert_to_utf8('windows-1250', $windows_1250_string);
is($ret, 'ěščřžýáíé',
	"Get UTF8 string converted from 'windows-1250' encoding.");

# Test.
## 'ěščřžýáíé&amp;'
$windows_1250_string = join '', map { chr } (0xEC, 0x9A, 0xE8, 0xF8, 0x9E,
	0xFD, 0xE1, 0xED, 0xE9, 0x26, 0x61, 0x6D, 0x70, 0x3B);
$ret = convert_to_utf8('windows-1250', $windows_1250_string);
is($ret, 'ěščřžýáíé&',
	"Get UTF8 string converted from 'windows-1250' encoding with '&amp;'.");
