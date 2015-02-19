use strict;
use warnings;
use feature 'switch';
use v5.10;
no warnings 'experimental::smartmatch';

open(my $in, '<', 'data/persondata.dump');
open(my $out, '>', 'data/persondata.csv');

print $out "name|name_alt|desc_short|date_birth|place_birth|date_death|place_death";

while (my $lin = <$in>){
	$lin =~ s/\[\[.*\|(.*)\]\],/$1,/;
	$lin =~ s/\[\[(.*)\]\],/$1,/;
	$lin =~ s/\[\[.*\|(.*)\]\]/$1/;
	$lin =~ s/\[\[(.*)\]\]/$1/;
	given ($lin) {
		when (/^.*Persondata.*/)	{print $out "\n"}
		when (/^\|\s*NAME\s*=(.*)/) {print $out "$1|"}
		when (/^\|\s*ALTERNATIVE NAMES\s*=(.*)/) {print $out "$1|"}
		when (/^\|\s*SHORT DESCRIPTION\s*=(.*)/) {print $out "$1|"}
		when (/^\|\s*DATE OF BIRTH\s*=(.*)/) {print $out "$1|"}
		when (/^\|\s*PLACE OF BIRTH\s*=(.*)/) {print $out "$1|"}
		when (/^\|\s*DATE OF DEATH\s*=(.*)/) {print $out "$1|"}
		when (/^\|\s*PLACE OF DEATH\s*=(.*)/) {print $out "$1"}
		default {}
	}
}

close $in;
close $out;
