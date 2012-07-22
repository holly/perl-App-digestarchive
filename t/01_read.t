use strict;
use Test::More tests => 9;
use App::digestarchive;
use FindBin qw($Bin);
use File::Spec;

our $tar_archive = File::Spec->catfile($Bin, "test-archive.tar");
our $gzip_archive = $tar_archive . ".gz";
our $bzip2_archive = $tar_archive . ".bz2";

my $app = App::digestarchive->new;

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
