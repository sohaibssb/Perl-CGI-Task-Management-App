#!/usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);
require 'utils.pl';

print header, start_html('View Tasks');

my $tasks = read_tasks();

print "<table border='1'>";
print "<tr><th>Title</th><th>Description</th><th>Due Date</th><th>Status</th><th>Actions</th></tr>";
foreach my $task (@$tasks) {
    print "<tr>";
    print "<td>$task->{title}</td>";
    print "<td>$task->{description}</td>";
    print "<td>$task->{due_date}</td>";
    print "<td>$task->{status}</td>";
    print "<td>",
        a({-href=>"edit_task.pl?id=$task->{id}"}, 'Edit'), " | ",
        a({-href=>"delete_task.pl?id=$task->{id}"}, 'Delete'),
        "</td>";
    print "</tr>";
}
print "</table>";

print end_html;