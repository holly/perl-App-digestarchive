use inc::Module::Install;
name 'App-digestarchive';
all_from 'lib/App/digestarchive.pm';

install_script "bin/digestarchive";

requires
	'Class::Accessor'         => '0.34',
	'Archive::Tar'            => '1.78',
	'Compress::Zlib'          => 0,
	'IO::Uncompress::Bunzip2' => 0,
	'Digest'                  => 0,
	'Digest::MD5'             => 0,
	'Digest::SHA1'            => 0,
;

# for Module::Install::TestTarget
default_test_target
	load_modules     => [qw(File::Spec File::Find File::Basename Archive::Tar Cwd)],
	run_on_prepare   => [qw(t/scripts/prepare.pl)],
	run_on_finalize  => [qw(t/scripts/finalize.pl)],

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
