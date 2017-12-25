use strict;
use warnings;

use MetaTrans::Base;
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my @ret = $obj->get_dest_lang_codes_for_src_lang_code;
is_deeply(
	\@ret,
	[],
	'No source language code.',
);

# Test.
@ret = $obj->get_dest_lang_codes_for_src_lang_code('cze');
is_deeply(
	\@ret,
	[],
	"No destination language codes for 'cze' source code - no 'cze' ".
		'language defined.',
);

# Test.
$obj->set_languages('cze');
@ret = $obj->get_dest_lang_codes_for_src_lang_code('cze');
is_deeply(
	\@ret,
	[],
	"No destination language codes for 'cze' source code - 'cze' ".
		'language is defined.',
);

# Test.
$obj->set_languages('ger');
$obj->set_dir_1_to_spec('cze', 'ger');
@ret = $obj->get_dest_lang_codes_for_src_lang_code('cze');
is_deeply(
	\@ret,
	['ger'],
	"Source language code 'cze' has destination 'ger' language code.",
);

# Test.
$obj->set_languages('eng');
$obj->set_dir_1_to_spec('cze', 'eng');
@ret = $obj->get_dest_lang_codes_for_src_lang_code('cze');
is_deeply(
	\@ret,
	['ger', 'eng'],
	"Source language code 'cze' has destination 'ger' and 'eng' ".
		'language code.',
);
