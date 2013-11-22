requires 'Class::Load';
requires 'Text::Markdown';
requires 'parent';

recommends 'Text::Markdown::Hoedown', '1.00';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.36';
};
