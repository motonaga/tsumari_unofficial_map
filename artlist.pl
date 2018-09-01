#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use JSON;
use Mojo::DOM;

open my $fh, 'artlist.html' or die;
my $artlist;
while (<$fh>) {
  $artlist .= $_;
}
close $fh;

my $dom = Mojo::DOM->new($artlist);
my @artworks = $dom->find('div.boxArtwork')->each;

print <<EOS;
id\ttitle\tname\thref\timage
EOS

my $base = 'http://www.echigo-tsumari.jp';

for my $artwork (@artworks) {
  my $a = $artwork->find('p.title')->first->find('a')->first;
  my $title = $a->content;
  my $href = $a->attr('href');
  my $name = $artwork->find('p.name')->first->content;
  my $photo = $artwork->find('p.photo')->first;
  my $img = $photo->find('img')->first->attr('src');
  my $id = $photo->find('span.icon')->first->content;
  $href = $base . $href;
  $img = $base . $img;
  print <<EOS;
$id\t$title\t$name\t$href\t=IMAGE("$img")
EOS
}

# print Dumper @artworks;