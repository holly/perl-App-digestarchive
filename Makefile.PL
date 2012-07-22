use inc::Module::Install;
name 'App-digestarchive';
all_from 'lib/App/digestarchive.pm';

install_script "bin/digestarchive";

requires 'Class::Accessor' => '0.34';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
