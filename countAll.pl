#!/usr/bin/perl -w
@files = </Users/jonathanbouchet/Desktop/WORK/PERL_EXAMPLES/*>;
foreach $file (@files) {
    print $file . "\n";
    my $f = $file;
    open (F, $f) || die "Could not open $f: $!\n";
    my @f = <F>;
    close F;
    my $lines = @f;
    print $lines ."\n";
}
