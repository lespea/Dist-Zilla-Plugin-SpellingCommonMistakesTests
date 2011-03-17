use strict;
use warnings;
use utf8;

package Dist::Zilla::Plugin::SpellingCommonMistakesTests;

#ABSTRACT:  Release tests for common POD spelling mistakes

=encoding utf8

=head1 SYNOPSIS

In your dist.ini file:

    [SpellingCommonMistakesTests]


=head1 DESCRIPTION

This is an extension of Dist::Zilla::Plugin::InlineFiles, providing the following file:

    xt/release/common_spelling.t - a standard Pod::Spell::CommonMistakes test

=head1 SEE ALSO
Pod::Spell::CommonMistakes
Test::Pod::Spelling::CommonMistakes

=cut


use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';


__PACKAGE__->meta->make_immutable;
no Moose;

#  Happy ending
1;


## no critic (Documentation::RequirePodAtEnd)

__DATA__
___[ xt/release/common_spelling.t ]___
#!/usr/bin/perl
use strict; use warnings;

use Test::More;

eval "use Test::Pod::Spelling::CommonMistakes";
if ( $@ ) {
    plan skip_all => 'Test::Pod::Spelling::CommonMistakes required for testing POD';
} else {
    all_pod_files_ok();
}
