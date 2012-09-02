use strict;
use Test::More;

use Text::Markup::Any;

my $md = Text::Markup::Any->new('Text::Markdown');
like $md->markup('## hoge'), qr!<h2>hoge</h2>!;


my $md2 = markupper 'Markdown';
like $md2->markup('## hoge'), qr!<h2>hoge</h2>!;

done_testing;
