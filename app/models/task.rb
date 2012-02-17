class Task < ActiveRecord::Base

  def done?
    done != 0
  end
  
  def move_up
  end
  
  def move_down
  end

end
