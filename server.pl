#!/usr/bin/perl -w
#Created: 2012-03-16 15:00
#Modified: 2012-03-16 15:00
#Author: William DiStefano
#Website: www.shwuzzle.com
use IO::Socket::INET;
$pt = shift or die "Error: port is missing\n";
$skt = IO::Socket::INET->new('LocalPort' => $pt,'Proto' => 'tcp','Listen' => SOMAXCONN) or die "Error: unable to create socket ($!)\n";
print "Ready for client...\n";
while ($cl = $skt->accept)
{
    $srv = gethostbyaddr($cl->peeraddr, AF_INET);
    $pt = $cl->peerport;
    while (<$cl>) { print "[$srv $pt] $_"; print $cl "$.: $_"; }
    close $cl or die "Error: unable to close ($!)\n";
}
die "Error: unable to accept socket ($!)\n";