#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use JSON;

open my $fh, 'test.json' or die;
my $json;
while (<$fh>) {
  $json .= $_;
}
close $fh;

# print Dumper $json;

my $data = decode_json($json);
print <<EOS;
name\tlatitude\tlongitude\tcategory\tarea\timage\turl
EOS
# print Dumper $data;
my $id = 0;
for my $entry (@{$data}) {
  $id++;
  my $name = ${$entry}[0];
  my $lat = ${$entry}[1];
  my $lng = ${$entry}[2];
  my $img = ${$entry}[3];
  my $area = ${$entry}[4];
  my $url = ${$entry}[5];
  my $icon = ${$entry}[6];
  my $category = ${$entry}[7];
  $img =~ s/.*src=\"([^\"]+).*/http:\/\/www.echigo-tsumari.jp$1/;
  # $img =~ s/\"/\\\"/g;
  $url = 'http://www.echigo-tsumari.jp' . $url;
  my $description = "$img\\\\n$category\\\\n$area\\\\n$url";
  print <<"EOS";
  $name\t$lat\t$lng\t$category\t$area\t$img\t$url
EOS
}

