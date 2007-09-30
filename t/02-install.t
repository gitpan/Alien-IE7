use strict;
use warnings;
use Test::More tests => 4;
use Test::Exception;
use File::Path qw(rmtree);
use Alien::IE7;

my $dir = 't/eraseme';

# Do an install and make sure that at least one file from each of the 'lib' and
# 'src' directories was installed properly.
Alien::IE7->install( $dir );
foreach my $file (qw( ie7-core.js ie7-content.htc ie7.gif )) {
    ok( -e "$dir/$file", "$dir/$file exists" );
}

# Re-install into the same directory, to make sure that it doesn't choke.
lives_ok { Alien::IE7->install($dir) };

# Clean out the test directory
rmtree( $dir );
