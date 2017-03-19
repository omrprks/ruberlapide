#!/usr/bin/env ruby

# TODO:
	# Insert random commas

require 'getoptlong'

$VERBA = [
	"lorem", "ipsum", "dolor", "sit", "amet",
	"a", "ac", "accumsan", "ad", "adipisicing",
	"aenean", "aliqua", "aliquam", "aliquet", "aliquip",
	"anim", "ante", "aptent", "arcu", "at",
	"auctor", "augue", "aute", "bibendum", "blandit",
	"cillum", "class", "commodo", "condimentum", "congue",
	"consectetaur", "consequat", "conubia", "convallis", "cras",
	"cubilia", "culpa", "cupidatat", "curabitur", "curae",
	"cursus", "dapibus", "deserunt", "diam", "dictum",
	"dictumst", "do", "dolore", "donec", "dui",
	"duis", "ea", "egestas", "eget", "eiusmod",
	"eleifend", "elementum", "elit", "enim", "erat",
	"eros", "esse", "est", "et", "etiam",
	"eu", "euismod", "ex", "excepteur", "exercitation",
	"facilisis", "fames", "faucibus", "felis", "fermentum",
	"feugiat", "fringilla", "fugiat", "fusce", "gravida",
	"habitant", "habitasse", "hac", "hendrerit", "himenaeos",
	"iaculis", "id", "imperdiet", "in", "inceptos",
	"incididunt", "integer", "interdum", "irure", "justo",
	"labore", "laboris", "laborum", "lacinia", "lacus",
	"laoreet", "lectus", "leo", "libero", "ligula",
	"litora", "lobortis", "luctus", "maecenas", "magna",
	"malesuada", "massa", "mattis", "mauris", "metus",
	"mi", "minim", "molestie", "mollis", "mollit",
	"morbi", "nam", "nec", "neque", "netus",
	"nibh", "nisi", "nisl", "non", "nostra",
	"nostrud", "nulla", "nullam", "nunc", "occaecat",
	"odio", "officia", "orci", "ornare", "pariatur",
	"pellentesque", "per", "pharetra", "phasellus", "placerat",
	"platea", "porta", "porttitor", "posuere", "potenti",
	"praesent", "pretium", "primis", "proident", "proin",
	"pulvinar", "purus", "quam", "qui", "quis",
	"quisque", "reprehenderit", "rhoncus", "risus", "rutrum",
	"sagittis", "sapien", "scelerisque", "sed", "sem",
	"semper", "senectus", "sint", "sociosqu", "sodales",
	"sollicitudin", "sunt", "suscipit", "suspendisse", "taciti",
	"tellus", "tempor", "tempus", "tincidunt", "torquent",
	"tortor", "tristique", "turpis", "ullamco", "ullamcorper",
	"ultrices", "ultricies", "urna", "ut", "varius",
	"vehicula", "vel", "velit", "venenatis", "veniam",
	"vestibulum", "vitae", "vivamus", "viverra", "voluptate",
	"volutpat", "vulputate", "ruber", "lapis"
]

$out = "ruberlapide.out"
$verbose = false

$usage =
"Usage: ruberlapide [OPTION] args
options:
	-o, --out	output file name (default: \"ruberlapide.out\")
	-w, --words	specifies the number of words to be generated
	-l, --lines	specifies the number of lines to be generated
	-p, --paragrahps	specifies the number of paragraphs to be generated
	-v, --verbose	prints output to console
	-V, --version	prints version information
	    --help	prints this message (\'-h\' for short message)

	example:
		$ ruberlapide -o \"Test.txt\" -w 42"

$opts = GetoptLong.new(
	["--help", GetoptLong::NO_ARGUMENT],
	["--version", "-V", GetoptLong::NO_ARGUMENT],
	["--verbose", "-v", GetoptLong::NO_ARGUMENT],
	["--out", "-o", GetoptLong::REQUIRED_ARGUMENT],
	["--words", "-w", GetoptLong::REQUIRED_ARGUMENT],
	["--lines", "-l", GetoptLong::REQUIRED_ARGUMENT],
	["--paragraphs", "-p", GetoptLong::REQUIRED_ARGUMENT],
)

$words, $lines, $paragraphs = 0, 0, 0;

$opts.each do |opt, arg|
	case opt
		when "--help"
			puts "#{$usage}"
			exit 1
		when "--version"
			puts "ruberlapide"
			exit 1
		when "--verbose"; $verbose = true
		when "--out"; $out = arg
		when "--words"; $words = arg
		when "--lines"; $lines = arg
		when "--paragraphs"; $paragraphs = arg
	end
end

# out = []
$verba_copy = []

# $generator = Random.new

$WORDS_PER_SENTENCE_AVG = rand(0.0..10.0);
$WORDS_PER_SENTENCE_STD = rand(10..30);

if $words == 0 && $lines == 0 && $paragraphs == 0 then
	puts "Please specify number of words, lines, or paragraphs to be generated.", $usage
	exit 1
end

# $n = $words == 0 ? ARGV[0].chomp.to_i : $VERBA.length

$n.times do |_|
	$verba_copy = $VERBA.dup if $verba_copy.empty?

	print(
		(_ >= 0 && _ <= 4 ? $verba_copy[_] : $verba_copy.shuffle!.pop).capitalize,
		(_ != ($n - 1) && _ % $WORDS_PER_SENTENCE_STD != 0 || _ == 0 ? ' ' : ".\n\n")
	) if $verbose

	# $out << (_ >= 0 && _ <= 4 ? $verba_copy[_] : $verba_copy.shuffle!.pop).capitalize
	# $out << ".\n" if _ == ($n - 1)
end

# File.open(filename, "wb").write($out.join(" "))
puts "Done" unless $verbose