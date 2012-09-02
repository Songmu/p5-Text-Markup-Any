use inc::Module::Install;
name 'Text-Markup-Any';
all_from 'lib/Text/Markup/Any.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
