class Task < ActiveRecord::Base
  belongs_to :project
  validates :name, :due_date , presence: true
  validates :name, length: {maximum: 100}

  attr_accessor :due_in

  def due_in
      (self.due_date - Date.current()).to_i
  end

  def set_priority
    if due_in < 3
      self.update(priority: 'Urgent')
    elsif due_in < 7
      self.update(priority: 'High')
    elsif due_in < 15
      self.update(priority: 'Med')
    else
      self.update(priority: 'Low')
    end
  end

end
