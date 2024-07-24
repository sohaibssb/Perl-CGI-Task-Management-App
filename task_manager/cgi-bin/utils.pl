use strict;
use warnings;
use JSON;

sub read_tasks {
    my $file = 'data/tasks.txt';
    open my $fh, '<', $file or die "Could not open '$file' $!";
    my $json_text = do { local $/; <$fh> };
    my $tasks = decode_json($json_text);
    return $tasks;
}

sub write_tasks {
    my ($tasks) = @_;
    my $file = 'data/tasks.txt';
    open my $fh, '>', $file or die "Could not open '$file' $!"
    print $fh encode_json($tasks);
    close $fh;
}

1;