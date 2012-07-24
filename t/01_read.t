use strict;
use Test::More tests => 9;
use App::digestarchive;
use File::Spec;

my $app = App::digestarchive->new;

my $tar_archive   = File::Spec->catfile(File::Spec->tmpdir, "test-archive.tar");
my $gzip_archive  = $tar_archive . ".gz";
my $bzip2_archive = $tar_archive . ".bz2";

ok $app->read($tar_archive), "read tar archive file";
ok $app->read($gzip_archive), "read gzip archive file";
ok $app->read($bzip2_archive), "read bzip2 archive file";

ok $app->read(slurp($tar_archive)), "read tar archive buffer";
ok $app->read(slurp($gzip_archive)), "read gzip archive buffer";
ok $app->read(slurp($bzip2_archive)), "read bzip2 archive buffer";

ok $app->read(file2fh($tar_archive)), "read tar archive filehandle";
ok $app->read(file2fh($gzip_archive)), "read gzip archive filehandle";
ok $app->read(file2fh($bzip2_archive)), "read bzip2 archive filehandle";

sub slurp {

	my $file = shift;
	open my $fh, "<", $file or die $!;
	my $buffer = do { local $/; <$fh> };
	close $fh;
	return $buffer;
}

sub file2fh {
	my $file = shift;
	open my $fh, "<", $file or die $!;
	return $fh;
}
