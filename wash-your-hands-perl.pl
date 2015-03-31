#!/usr/bin/perl

use strict;
use warnings;

use Term::ANSIColor;

# Ask the question
sub user_used_toilet {
	print color 'bold blue';
	print "Did you use any of the toilets? [y/n]\n";
	print color 'reset';
	my $used_toilet = <STDIN>;
	chomp ($used_toilet);
	$used_toilet = lc($used_toilet);
	return $used_toilet;
};

# Wash hands
sub directions_wash_hands {
	print color 'red bold';
	print qq {Steps to Wash Hands:
1) Turn water on at sink.
2) Wet your hands with running water.
3) Apply liquid, bar or powder soap.
4) Lather well.
5) Rub your hands vigorously for at least 20 seconds. Remember to scrub all surfaces, including the backs of your hands, wrists, between your fingers and under your fingernails.
6) Rinse well.
7) Dry your hands with a clean or disposable towel or air dryer. If possible, use your towel to turn off the faucet.
};
	print color 'reset';
};

my $used_toilet = user_used_toilet;

if ($used_toilet =~ /^(y|yes|yup|yuppers|affirmative)$/) {
	print color 'green bold';
	print "Did you wash your hands? [y/n]\n";
	print color 'reset';
	my $washed_hands = <STDIN>;
	if ($washed_hands =~ /^(y|yes|yup|yuppers|affirmative)$/) {
		print color 'yellow';
		print "Thank you. Have a great day!\n";
		print color 'reset';
		exit;
	} elsif ($washed_hands =~ /^(n|no|nope|nopers|negative)$/) {
		directions_wash_hands;
	} else {
		print "It appears you have not answered the question. Try again.\n";
	};
} elsif ($used_toilet =~ /^(n|no|nope|nopers|negative)$/) {
	print color 'yellow';
	print "Have a great day!\n";
	print color 'reset';
	exit;
} else {
	print "It appears you have not answered the question. Try again.\n";
}


