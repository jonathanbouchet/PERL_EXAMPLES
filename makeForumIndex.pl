#!/usr/bin/perl -w

use Cwd;
#go to directory with forum names
#my $directory = getcwd;
my directory = "/data/WWW/hnstar";

print " current directory : $directory\n";
opendir(DIRHANDLE, $directory) or die "couldn't open $directory : $!\n";

#get the forum list
my $filename = 'forum.list';
open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

while (my $row = <$fh>) {
    chomp $row;

    #create path to sub-directories
    my $path = $directory.'/'.$row;
    #print "$path\n";
    
    #index by forum , placeholder
    #/usr/local/bin/glimpseindex -n -M 20 -H . -i -z .

    #retrieve file with previous DATE/TIME -lastTimeStamp.txt- and compare with the current one
    #assume lastTimeStamp.txt exists
    if (-e lastTimeStamp)
    {
	#make one with name lastTimeStamp.yyyymm22.txt
    }
    my $oldIndex = lastTimeStamp;

    # then make comparisn btw oldIndex and currwent one
    
    my $currentForumResponse = $path.'/'."response.html";
    #print "$currentForumResponse\n";
    SearchTimeStamp($currentForumResponse);
}
closedir(DIRHANDLE);

# open response.html and retrieve the DATE/TIME of the last message
sub SearchTimeStamp{
    my ($current) = @_;
    print "in subroutine : $current\n";
    # open the file
    if( -e $current)
    {
	open (F, $current) || die "Could not open $current: $!\n";
	my @f = <F>;
	close F;
	my $lines = @f;
	print $lines ."\n";
    }
}

# format of lastTimeStamp.txt
# forum/time
# example :
# starspin : 08 Nov 2015 03:27:02
# starsoft : 06 Nov 2015 18:06:01
# etc ...
