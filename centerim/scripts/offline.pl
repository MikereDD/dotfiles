#!/usr/bin/perl

use strict;
use warnings;
#returns 0 on success
#                1 else
sub which {
        my $programname = shift;
        my $path = $ENV{'PATH'} or return 1;
        my @paths = split(/:/, $path);
        foreach $path (@paths){
                $path .= "/$programname";
                if (-e $path){
                        return 0;
                }
        }
        return 1;
}
die "dzen not found" if (which("dzen2") == 1);


my $nick = $ARGV[0] || die "ARGV[0]: $!";
$nick =~ s#\s+##g;
my $centerimdir = ($ENV{'HOME'} || die $!) . "/.centericq/";
$centerimdir = ($ENV{'HOME'} || die $!) . "/.centerim/" if (! -e $centerimdir);
my $seen = $centerimdir . ".seen";
my @nicks;
#do nothing if the file doesn't exist
exit(0) if (! -e $seen);

open my $filehandle, "<", $seen or die "Can't open $seen : $!";
@nicks = <$filehandle>;
close $filehandle;
exit(0) if ((grep /^$nick$/, @nicks) == 0);
chomp foreach(@nicks);
@nicks = grep !/^$nick$/, @nicks;
@nicks = grep !/^s*$/, @nicks;
open  $filehandle, ">", $seen or die "Can't open $seen for write access: $!";
foreach my $line(@nicks){
	chomp $line;
	print $filehandle "$line\n";
}
close $filehandle;

exit(0);

