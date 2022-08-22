require 'todo'
require 'todo_list'

RSpec.describe TodoList do
  context "if there are no entries" do
    it "returns an error when asked to show complete or incomplete tasks" do
    my_todo = TodoList.new
    expect{ my_todo.incomplete }.to raise_error "You don't have any tasks in the list!"
    expect{ my_todo.complete }.to raise_error "You don't have any tasks in the list!"
    end
 end
end