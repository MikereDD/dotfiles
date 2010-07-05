#!/usr/bin/perl

use strict;
use warnings;

#modify this to change the appearance of dzen2
#---------------------------------------------
my $textalign = "c"; # c=center, l=left, r=right...
my $timeout = 0;  # timeout in seconds, 0 = forever
my $background = "red";
my $textcolor = "white";
my $height = 18;
my $width = 1000;
my $x_gap = 140;
my $dzen = "dzen2 -bg $background -fg $textcolor -e \"entertitle=grabmouse;button1=exit\" " .
				"-ta $textalign -p $timeout -h $height -w $width -x $x_gap";
#--------------------------------------------
#returns 0 on success
#        1 else
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
my $filehandle;
my @nicks;

#exit if we're not running under X...
exit(0) if ($ENV{'DISPLAY'} eq "");
#exit if dzen2 is not installed
die "dzen2 not found" if (which("dzen2") == 1);
#we do need an argument for this script....
my $nick = $ARGV[0] || die "ARGV[0]: $!";
#make sure, the nick doesn't contain any whitespaces
$nick =~ s#\s+##g;
#if ~/.centericq exists, ~/.centerim will be ignored
my $centerimdir = ($ENV{'HOME'} || die $!) . "/.centericq/";
$centerimdir = ($ENV{'HOME'} || die $!) . "/.centerim/" if (! -e $centerimdir);

#maybe there's a nicer way to do this...
my $pidfile = $centerimdir . "pid";
open $filehandle, "<", $pidfile or die "Can't open pidfile $pidfile : $!";
my $pid = <$filehandle>;
close $filehandle;
chomp $pid;
die "Centericq's not running!" unless (-e "/proc/" . $pid);

my $seen = $centerimdir . ".seen";
#file already exists
if (-e $seen){
	open my $filehandle, "<", $seen or die "Can't open $seen : $!";
	@nicks = <$filehandle>;
	close $filehandle;
}
#exit if the nick is already in the list
exit(0) if((grep /^$nick$/, @nicks) != 0);

open my $pipe, "| $dzen" or die "Can't open pipe $!";
print $pipe "New message from $nick\n";
close $pipe;
open $filehandle, ">>", $seen or die "Can't open $seen for write access: $!";
print $filehandle "$nick\n";
close $filehandle;

exit(0);

