
my $cwd = cwd;

my $tar = Archive::Tar->new;
my @files;

my $archive_dir = "t/test-archive";

$tar_archive   = File::Spec->catfile(File::Spec->tmpdir, "test-archive.tar");
$gzip_archive  = $tar_archive . ".gz";
$bzip2_archive = $tar_archive . ".bz2";

chdir dirname($archive_dir) or die "can not change directory. $!";

find(sub { push @files, $File::Find::name }, basename($archive_dir));
$tar->add_files(@files);

$tar->write($tar_archive);
$tar->write($gzip_archive, COMPRESS_GZIP);
$tar->write($bzip2_archive, COMPRESS_BZIP);

chdir $cwd or die "can not change directory. $!";
