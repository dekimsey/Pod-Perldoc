# Time-stamp: "2008-04-05 11:43:00 BRT"

use 5.006; # Perldoc.pm currently needs at least this version
use strict;
use warnings;

use ExtUtils::MakeMaker;

my $EUMM_VERSION = $ExtUtils::MakeMaker::VERSION;

WriteMakefile(
    'NAME'	=> 'Pod::Perldoc',
    'VERSION_FROM' => 'lib/Pod/Perldoc.pm',

    'AUTHOR'         => 'Adriano R. Ferreira <ferreira@cpan.org>', # maintainer
    'ABSTRACT_FROM'  => 'lib/Pod/Perldoc.pm',

    ($] >= 5.008001 ? ( 'INSTALLDIRS'  => 'perl' ) : ()),

    'PREREQ_PM' => {
		    # Are there any hard dependencies not covered here?
		    'Config' => 0,
		    'Text::ParseWords' => 0,
		    'Symbol' => 0,
		    'Fcntl' => 0,
		    'warnings' => 0,
		    'strict' => 0,
		    'File::Temp' => 0,
		    'File::Spec::Functions' => 0,
		   },
    'EXE_FILES' => [qw( perldoc )],

    ( $EUMM_VERSION > 6.31 ? (
        'LICENSE' => 'perl',
    ) : () ),
);

package MY;

sub libscan
{ # Determine things that should *not* be installed
    my($self, $path) = @_;
    return '' if $path =~ m/~/;
    $path;
}

__END__
