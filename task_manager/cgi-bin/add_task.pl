use strict; 
use warnings; 
use CGI qw(:standard);
require 'utils.pl';

print header, start_html('Add Task');

if (param('title')) {
    my $title = param('title');
    my $description = param('description');
    my $due_data = param('due_data');

    my $tasks = read_tasks();
    push @tasks, { title => $title, description => $description, due_data => $due_data, status => 'pending'};

    print "Task added successfully!<br>";
}

print start_form,
    "Title: ", textfield('title'), "<br>",
    "Description: ", textarea('description'), "<br>",
    "Due Date: ", textfield('due_date'), "<br>",
    submit('Add Task'),
    end_form;

print end_html;