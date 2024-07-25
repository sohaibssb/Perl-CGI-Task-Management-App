use strict; 
use warnings; 
use CGI qw(:standard);
use CGI::Carp 'fatalsToBrowser';
require 'utils.pl';

print header, start_html('Add Task');

if (param('title')) {
    my $title = param('title');
    my $description = param('description');
    my $due_data = param('due_data');

    my $tasks = read_tasks();
    my $id = @$tasks ? $tasks->[-1]->{id} + 1 : 1;
    push @$tasks, { id => $id, title => $title, description => $description, due_date => $due_date, status => 'pending' };
    write_tasks($tasks);

    print "Task added successfully!<br>";
}

print start_form,
    "Title: ", textfield('title'), "<br>",
    "Description: ", textarea('description'), "<br>",
    "Due Date: ", textfield('due_date'), "<br>",
    submit('Add Task'),
    end_form;

print end_html;