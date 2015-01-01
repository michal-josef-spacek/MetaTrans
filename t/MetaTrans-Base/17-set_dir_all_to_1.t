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
	$obj->set_dir_all_to_1;
};
$SIG{'__WARN__'} = $old;
# XXX Remove this warning.
like($EVAL_ERROR, qr{^Use of uninitialized value \$dest_lang_code in hash element},
	'Undefined destination language code.');

# Test.
$SIG{'__WARN__'} = sub {};
my $ret = $obj->set_dir_all_to_1;
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if destination language code doesn't defined.");

# Test.
$SIG{'__WARN__'} = sub { die $_[0]; };
eval {
	$obj->set_dir_all_to_1('cze');
};
$SIG{'__WARN__'} = $old;
like($EVAL_ERROR, qr{^language 'cze' not supported},
	"Destination language code 'cze' doesn't set.");

# Test.
$SIG{'__WARN__'} = sub {};
$ret = $obj->set_dir_all_to_1('cze');
$SIG{'__WARN__'} = $old;
is($ret, 0, "Return value if destination language code 'cze' doesn't set.");

# Test.
$obj->set_languages('cze');
$ret = $obj->set_dir_all_to_1('cze');
is($ret, 0, 'No direction.');

# Test.
$obj->set_languages('ger');
$ret = $obj->set_dir_all_to_1('cze');
is($ret, 1, "Set direction from all source language codes ('ger').");

# Test.
$obj->set_languages('rus', 'eng');
$ret = $obj->set_dir_all_to_1('cze');
is($ret, 3, 'Set direction from all source languages codes '.
	"('ger', 'rus' and 'eng'.");
