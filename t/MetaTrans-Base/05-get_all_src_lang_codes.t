use strict;
use warnings;

use MetaTrans::Base;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = MetaTrans::Base->new;
my @ret = $obj->get_all_src_lang_codes;
is_deeply(
	\@ret,
	[],
	'No source language codes - without any languages and directions.',
);

# Test.
$obj->set_languages('cze');
@ret = $obj->get_all_src_lang_codes;
is_deeply(
	\@ret,
	[],
	"No source language codes - with 'cze' and without directions.",
);

# Test.
$obj->set_languages('ger');
$obj->set_dir_1_to_spec('cze', 'ger');
@ret = $obj->get_all_src_lang_codes;
is_deeply(
	\@ret,
	['cze'],
	"Source 'cze' language code.",
);
