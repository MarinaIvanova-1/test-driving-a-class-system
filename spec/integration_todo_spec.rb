require 'todo'
require 'todo_list'

RSpec.describe "integration" do
  context "if there are many entries" do
    it "returns a list of only completed entries if asked so" do
      my_todo = TodoList.new
      todo_1 = Todo.new("Walk the dog")
      todo_2 = Todo.new("Clean the flat")
      todo_3 = Todo.new("Buy coffee")
      my_todo.add(todo_1)
      my_todo.add(todo_2)
      my_todo.add(todo_3)
      todo_2.mark_done!
      expect(my_todo.incomplete).to eq [todo_1, todo_3]
      expect(my_todo.complete).to eq [todo_2]
    end

    it "marks all todo as complete if a user gives up" do
      my_todo = TodoList.new
      todo_1 = Todo.new("Walk the dog")
      todo_2 = Todo.new("Clean the flat")
      my_todo.add(todo_1)
      my_todo.add(todo_2)
      my_todo.give_up!
      expect(my_todo.complete).to eq [todo_1, todo_2]
    end
 end
end