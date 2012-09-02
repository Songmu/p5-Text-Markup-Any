package Text::Markup::Any;
use strict;
use warnings;
use utf8;
our $VERSION = '0.01';

use Class::Load qw/load_class/;

my $markdown = {format_method   => 'markdown'};
our %MODULES = (
    'Text::Markdown'            => $markdown,
    'Text::MultiMarkdown'       => $markdown,
    'Text::Markdown::Discount'  => $markdown,
    'Text::Markdown::GitHubAPI' => $markdown,
    'Text::Xatena'              => {format_method => 'format'},
    'Text::Textile'             => {format_method => 'process'},
);

sub new {
    my ($pkg, $class, %args) = @_;

    my $info = $MODULES{$class}
        or die "no configuration found: $class. You want to use $class, directory call $pkg->adaptor constractor.";

    $info->{args} = {
        %{ $info->{args} },
        %args,
    } if %args;

    $pkg->adaptor(
        class   => $class,
        %$info,
    );
}

# taken from Ark::Models
sub adaptor {
    my ($pkg, %info) = @_;

    my $class         = $info{class} or die q{Required class parameter};
    my $format_method = $info{format_method} or die q{Required format_method parameter};
    my $constructor   = $info{constructor} || 'new';

    load_class($class);

    my $instance;
    if ($info{deref} and my $args = $info{args}) {
        if (ref($args) eq 'HASH') {
            $instance = $class->$constructor(%$args);
        }
        elsif (ref($args) eq 'ARRAY') {
            $instance = $class->$constructor(@$args);
        }
        else {
            die qq{Couldn't dereference: $args};
        }
    }
    elsif ($info{args}) {
        $instance = $class->$constructor($info{args});
    }
    else {
        $instance = $class->$constructor;
    }

    bless {
        _instance      => $instance,
        _format_method => $format_method,
    }, $pkg;
}

sub format {
    my ($self, @text) = @_;

    my $meth = $self->{_format_method};
    $self->{_instance}->$meth(@text);
}



1;
__END__

=head1 NAME

Text::Markup::Any -

=head1 SYNOPSIS

  use Text::Markup::Any;

=head1 DESCRIPTION

Text::Markup::Any is

=head1 AUTHOR

Masayuki Matsuki E<lt>y.songmu@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
