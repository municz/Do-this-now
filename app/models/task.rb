class Task < ActiveRecord::Base

  def done?
    done != 0
  end
  
  def move_task(direction = :up)
  
    #selection of the task which priority will be replaced
    selectPriority = direction == :up ? "priority < ?" : "priority > ?"
    order = direction == :up ? "priority DESC" : "priority"
  
    Task.transaction do
      task_to_replace = Task.where(:user_id => user_id).where(selectPriority, priority).order(order).first
      if task_to_replace
        this_task = Task.where(:id => id).first
        
        old_priority = task_to_replace.priority
        task_to_replace.priority = priority      
        this_task.priority = old_priority
        
        this_task.save
        task_to_replace.save
      end  
    end       
  end
  
  def move_up
    move_task(:up)
  end
  
  def move_down
    move_task(:down)
  end

end
