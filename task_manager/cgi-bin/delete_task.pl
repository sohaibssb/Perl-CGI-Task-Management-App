#!/usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);
use CGI::Carp 'fatalsToBrowser';
require 'utils.pl';

print header, start_html('Delete Task');

my $id = param('id');
my $tasks = read_tasks();

if (param('action') && param('action') eq 'Delete') {
    @$tasks = grep { $_->{id} != $id } @$tasks;
    write_tasks($tasks);

    print "Task deleted successfully!<br>";
    print a({-href=>"view_tasks.pl"}, "Back to task list");
} else {
    my ($task) = grep { $_->{id} == $id } @tasks;
    print "Are you sure you want to delete the task: $task->{title}?<br>";
    print start_form,
        hidden('id', $task->{id}),
        submit(-name=>'action', -value=>'Delete'),
        end_form;
}

print end_html;