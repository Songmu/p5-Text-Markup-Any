use strict;
use Test::More;

use Text::Markup::Any;

my $md = Text::Markup::Any->new('Text::Markdown');

like $md->format('## hoge'), qr!<h2>hoge</h2>!;

done_testing;
