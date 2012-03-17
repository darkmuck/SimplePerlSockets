#!/usr/bin/perl -w
#Created: 2012-03-16 15:00
#Modified: 2012-03-16 15:00
#Author: William DiStefano
#Website: www.shwuzzle.com
use IO::Socket::INET;
$srv = shift or die "Error: server name is missing\n";
$pt = shift or die "Error: port is missing\n";
$skt = IO::Socket::INET->new('PeerAddr' => $srv,'PeerPort' => $pt,'Proto' => 'tcp') or die "Error: Unable to create socket ($!)\n";
print "Connected...\n";
while (<STDIN>) { print $skt $_; print scalar <$skt>; }
close $skt or die "Error: Unable to close socket ($!)\n";