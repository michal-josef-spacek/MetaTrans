# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl module for structured errors.';
author 'Jan Pomikalek <xpomikal@fi.muni.cz>';
author 'Michal Spacek <skim@cpan.org>';
license 'perl-5';
name 'MetaTrans';
requires 'Carp' => 0;
requires 'Encode' => 0;
requires 'Getopt::Long' => 0;
requires 'IO::Select' => 0;
requires 'HTML::Entities' => 0;
requires 'HTTP::Response' => 0;
requires 'LWP::UserAgent' => 0;
requires 'Proc::SyncExec' => 0;
requires 'Readonly' => 0;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=MetaTrans';
resources 'homepage' => 'https://github.com/tupinek/MetaTrans';
resources 'repository' => 'git://github.com/tupinek/MetaTrans';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '1.06';

# Run.
WriteAll();
