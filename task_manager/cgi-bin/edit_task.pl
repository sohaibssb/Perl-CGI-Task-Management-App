#!/usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);
use CGI::Carp 'fatalsToBrowser';
require 'utils.pl';

print header, start_html('Edit Task');

my $id = param('id');
my $tasks = read_tasks();

my ($task) = grep { $_->{id} == $id } @tasks;

if (param('action') && param('action') eq 'Save') {
    $task->{title} = param('title');
    $task->{description} = param('description');
    $task->{due_date} = param('due_date');
    $task->{status} = param('status');
    write_tasks($tasks);

    print "Task updated successfully!<br>";
}

print start_from, 
    hidden('id', $task->{id}),
    "Title: ", textfield('title', $task->{title}), "<br>",
    "Description: ", textarea('description', $task->{description}), "<br>",
    "Due Date: ", textfield('due_date', $task->{due_date}), "<br>",
    "Status: ", popup_menu(-name=>'status', -values=>['pending', 'completed'], -default=>$task->{status}), "<br>",
    submit(-name=>'action', -value=>'Save'),
    end_form;

print end_html