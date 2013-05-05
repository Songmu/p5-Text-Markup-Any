# NAME

Text::Markup::Any - Common Lightweight Markup Language Interface

# SYNOPSIS

    use Text::Markup::Any;

    # OO Interface
    my $md = Text::Markup::Any->new('Text::Markdown');
    my $html = $md->markup('# hoge'); # <h1>hoge</h1>

    # Functional Interface
    my $tx = markupper 'Textile'; # snip 'Text::' in functional inteface.
    my $html = $tx->markup('h1. hoge'); # <h1>hoge</h1>

# DESCRIPTION

Text::Markup::Any is Common Lightweight Markup Language Interface.
Currently supported modules are Text::Markdown, Text::MultiMarkdown,
Text::Markdown::Discount, Text::Xatena and Text::Textile.

# AUTHOR

Masayuki Matsuki <y.songmu@gmail.com>

# SEE ALSO

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
