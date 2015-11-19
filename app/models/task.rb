class Task < ActiveRecord::Base
  belongs_to :project

  # after_initialize :set_priority

  attr_accessor :due_in

  def due_in
      (self.due_date - Date.current()).to_i
  end

  def set_priority
    if due_in < 2
      self.update(priority: 'Urgent')
    elsif due_in < 5
      self.update(priority: 'High')
    elsif due_in < 8
      self.update(priority: 'Med')
    else
      self.update(priority: 'Low')
    end
  end

end
