class Todo
  def initialize(task, done = false) 
    @task = task
    @done = false

  end

  def task
    return @task
  end

  def done
    return @done
  end

  def mark_done!
    @done = true
  end

  def done?
    return @done
  end
end