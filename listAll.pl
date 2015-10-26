my $directory='/Users/Jonathan/Desktop/WORK/PERL_CODE';
my $size=0;
my $file;

opendir(DIRHANDLE, $directory) or die "couldn't open $directory : $!\n
+";
my@files = grep(!/^\.\.?$/,readdir(DIRHANDLE));

foreach $file (@files)
 {
   $size=(-s "$directory/$file");
   #print "$directory,$file,$size\t";
   open (F, $file) || die "Could not open $file: $!\n";
   my @f = <F>;
   close F;
   my $lines = @f;
   #print $lines ."\t ";
   #print "\n";
   print "$directory,$file,$size,$lines\n";
 }
closedir(DIRHANDLE);
