use strict;
use warnings;

use English;
use MetaTrans::Base;
use Test::More 'tests' => 13;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my $old = $SIG{'__WARN__'};
$SIG{'__WARN__'} = sub { die $_[0]; };
# XXX Remove this warning.
eval {
	$obj->set_dir_1_to_1;
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^Use of uninitialized value \$src_lang_code in hash element},
	'Undefined source language code.');

# Test.
$SIG{'__WARN__'} = sub {};
# XXX Remove this warning.
my $ret = $obj->set_dir_1_to_1;
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if source language code doesn't defined.");

# Test.
$SIG{'__WARN__'} = sub { die $_[0]; };
# XXX Remove this warning.
eval {
	$obj->set_dir_1_to_1('cze');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^Use of uninitialized value \$dest_lang_code in concatenation},
	'Undefined destination language code.');

# Test.
$SIG{'__WARN__'} = sub {};
# XXX Remove this warning.
$ret = $obj->set_dir_1_to_1('cze');
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if source language code 'cze' doesn't set.");

# Test.
$SIG{'__WARN__'} = sub { die $_[0]; };
eval {
	$obj->set_dir_1_to_1('cze', 'ger');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^language 'cze' not supported, not setting 'cze2ger' at},
	"Source language code 'cze' doesn't set.");

# Test.
$SIG{'__WARN__'} = sub {};
$ret = $obj->set_dir_1_to_1('cze', 'ger');
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if source language code 'cze' doesn't set.");

# Test.
$obj->set_languages('cze');
$SIG{'__WARN__'} = sub { die $_[0]; };
# XXX Remove this warning.
eval {
	$obj->set_dir_1_to_1('cze');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^Use of uninitialized value \$dest_lang_code in hash element},
	'Undefined destination language code.');

# Test.
$SIG{'__WARN__'} = sub {};
# XXX Remove this warning.
$ret = $obj->set_dir_1_to_1('cze');
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if destination language code doesn't set.");

# Test.
$SIG{'__WARN__'} = sub { die $_[0]; };
eval {
	$obj->set_dir_1_to_1('cze', 'ger');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^language 'ger' not supported, not setting 'cze2ger'},
	"Language code 'ger' doesn't exist.");

# Test.
$SIG{'__WARN__'} = sub {};
$ret = $obj->set_dir_1_to_1('cze', 'ger');
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if destination language code 'ger' doesn't exist.");

# Test.
$obj->set_languages('ger');
$ret = $obj->set_dir_1_to_1('cze', 'ger');
is($ret, 1, "Set direction to 'ger' destination language code.");

# Test.
# TODO Bug.
$ret = $obj->set_dir_1_to_1('cze', 'cze');
is($ret, 1, 'Set direction to same language.');
