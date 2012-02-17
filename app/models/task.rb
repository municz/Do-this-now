class Task < ActiveRecord::Base

  def done?
    done != 0
  end

end
