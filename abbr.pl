#!/opt/local/bin/perl

sub abbreviate {
    $_ = shift;


    s{ / }{/}g;
    s/ - / /g;
    s/of/o/gi;
    s/and/&/gi;
    s/the //gi;
    s/with /w\//gi;
    s/[*<>=]+/ /g;

    # remove vowels, when not next to a word boundary or another vowel.
    #   open house mission district --> opn house mssion dstrct
    #   noe valley --> noe vlley
    s/(?<!\b)(?<![aeiouy])[aeiouy](?!\b)(?![aeiouy])//ig;

    s/\s+/ /g;
    return $_;
}

while (<>) {
  print abbreviate($_), "\n";
}
