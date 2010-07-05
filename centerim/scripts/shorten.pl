#!/usr/local/bin/perl -w
=pod

=head1 Author information

=item *
Name: eydaimon

=item *
Email: cicq@7thfire.com

=item *
UIN: 8067723

=head1 Example usage

    %action URL_shorten
    event           msg
    proto           all
    status          all
    options         stdin stdout

    %exec
    msg=`cat`
    $HOME/.centericq/scripts/shorten.pl $msg

=cut
use strict;
use FindBin;
use lib "$FindBin::Bin/";
use Getopt::Long;
use LWP::Simple qw($ua get);
use URI::Escape qw(uri_escape);


my %opt;
GetOptions(\%opt,"log");
my $MAXLEN=50; #maximum url before it get's shorteened
exit unless "@ARGV" =~ m|https?://|;
my $log = "$ENV{HOME}/.centericq/urllog.html";
my $tmp_log = "$log.$$";
if ($opt{'log'}) {
    open TMP_LOG, ">$tmp_log" or die "Can't open $log: $!\n";
    open LOG, "<$log" or die "Can't open $log: $!\n";
}
my $time= localtime(time);
my %seen;

for(@ARGV) {
    next unless m|^https?://|;
    next if $seen{$_};
    $seen{$_}=1;
    if (my $short = shorten($_)) { print "$short\n"; }
    if ($opt{'log'}) {
        print TMP_LOG "<p>At: $time<br>From: $ENV{CONTACT_NICK} ($ENV{EVENT_NETWORK})<br> <a href=\"$_\">$_</a><br>\n";
    }
}
if ($opt{'log'}) {
    while(<LOG>) { print TMP_LOG $_; }
    close LOG;
    close TMP_LOG;
    rename($tmp_log,$log);
    unlink $tmp_log;
}

sub shorten {
    return 0 if length($_[0]) < $MAXLEN;
    my $long_url = uri_escape($_[0]);
    my $short = $ua->post("http://qurl.com/automate.php", { url => $long_url })->content;
    return "" if $short =~ /^ERROR/;
    return substr($_[0],0,17) . "... -> $short";
=pod
    my $long_url = uri_escape($_[0]);
    my $short = $ua->post("http://metamark.net/api/rest/simple", { long_url => $long_url })->content;
    return "" if $short =~ /^ERROR/;
    return substr($_[0],0,17) . "... -> $short";
=cut
}

