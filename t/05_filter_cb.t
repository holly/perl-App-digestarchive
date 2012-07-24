use strict;
use Test::More;
use App::digestarchive;
use File::Spec;

my $tar_archive = File::Spec->catfile(File::Spec->tmpdir, "test-archive.tar");

my $app = App::digestarchive->new;
$app->read($tar_archive);
my $all = $app->all(sub {
						my $f = shift;
						return $f->type == 0 || $f->type == 1 ? 1 : 0 
					});

foreach my $f (@{$all}) {

	ok $f->type == 0 || $f->type == 1, "filter_cb ok";
}

done_testing;
