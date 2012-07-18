# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl module for structured errors.';
author 'Jan Pomikalek <xpomikal@fi.muni.cz>';
author 'Michal Špaček <skim@cpan.org>';
install_script 'bin/metatrans';
install_script 'bin/runtrans';
license 'perl-5';
name 'MetaTrans';
requires 'Config::Find' => 0;
requires 'Config::General' => 0;
requires 'HTML::Entities' => 0;
requires 'HTTP::Request' => 0;
requires 'HTTP::Response' => 0;
requires 'LWP::UserAgent' => 0;
requires 'Proc::SyncExec' => 0;
requires 'Readonly' => 0;
requires 'Tk' => 804.027;
requires 'Tk::BrowseEntry' => 0;
requires 'Tk::DialogBox' => 0;
requires 'Tk::HList' => 0;
requires 'Tk::ItemStyle' => 0;
requires 'Tk::LabFrame' => 0;
requires 'Tk::ROText' => 0;
requires 'URI::Escape' => 0;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=MetaTrans';
resources 'homepage' => 'https://github.com/tupinek/MetaTrans';
resources 'repository' => 'git://github.com/tupinek/MetaTrans';
tests_recursive;
version '1.06';

# Run.
WriteAll();

sub MY::postamble {
	return "install :: install_config\n\ninstall_config :\n\t".
		'$(NOECHO)$(ECHO_N) "Installing configuration file to "; '.
		'(cp -f config/metatrans.conf /etc/ 2> /dev/null && echo /etc/metatrans.conf) '.
		'|| '.
		'(cp -f config/metatrans.conf '.$ENV{'HOME'}.'/.metatrans '.
		'&& echo '.$ENV{'HOME'}.'/.metatrans)';
}

