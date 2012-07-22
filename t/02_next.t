use strict;
use Test::More tests => 3;
use App::digestarchive;
use FindBin qw($Bin);
use File::Spec;

our $tar_archive = File::Spec->catfile($Bin, "test-archive.tar");

my $app = App::digestarchive->new;
$app->read($tar_archive);
my $f = $app->next;

isa_ok $f, "Archive::Tar::File", "\$f is Archive::Tar::File package" ;
ok eval { $f->can("digest") } , "Archive::Tar::File digest method";
ok eval { $f->can("link_or_real_name") } , "Archive::Tar::File link_or_real_name method";
