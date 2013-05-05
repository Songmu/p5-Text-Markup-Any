requires 'Class::Load';
requires 'Text::Markdown';
requires 'parent';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.36';
};
