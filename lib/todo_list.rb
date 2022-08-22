class TodoList
  def initialize
    @all_todos = []
  end

  def add(todo) 
    @all_todos << todo
  end

  def incomplete
    fail "You don't have any tasks in the list!" if @all_todos.empty?
    incomplete_list = []
    @all_todos.each do |todo|
      if todo.done == false
        incomplete_list << todo
      end
    end
    return incomplete_list
  end

  def complete
    fail "You don't have any tasks in the list!" if @all_todos.empty?
    complete_list = []
    @all_todos.each do |todo|
      if todo.done == true
        complete_list << todo
      end
    end
    return complete_list
  end

  def give_up!
    @all_todos.each do |todo|
      todo.mark_done!
    end
  end
end
