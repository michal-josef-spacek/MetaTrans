# Pragmas.
use strict;
use warnings;

# Modules.
use English;
use MetaTrans::Base;
use Test::More 'tests' => 8;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $old = $SIG{'__WARN__'};
$SIG{'__WARN__'} = sub { die $_[0]; };
eval {
	$obj->set_dir_1_to_all;
};
$SIG{'__WARN__'} = $old;
# XXX Remove this warning.
like($EVAL_ERROR, qr{^Use of uninitialized value},
	'Undefined source language code.');

# Test.
$SIG{'__WARN__'} = sub {};
my $ret = $obj->set_dir_1_to_all;
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if source language code doesn't defined.");

# Test.
$SIG{'__WARN__'} = sub { die $_[0]; };
eval {
	$obj->set_dir_1_to_all('cze');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^language 'cze' not supported},
	"Source language code 'cze' doesn't set.");

# Test.
$SIG{'__WARN__'} = sub {};
$ret = $obj->set_dir_1_to_all('cze');
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if source language code 'cze' doesn't set.");

# Test.
$obj->set_languages('cze');
$ret = $obj->set_dir_1_to_all('cze');
is($ret, 0, 'No direction.');

# Test.
$obj->set_languages('ger');
$ret = $obj->set_dir_1_to_all('cze');
is($ret, 1, "Set direction to all destination language codes ('ger').");

# Test.
$obj->set_languages('rus', 'eng');
$ret = $obj->set_dir_1_to_all('cze');
is($ret, 3, 'Set direction to destination languages codes '.
	"('ger', 'rus' and 'eng'.");
