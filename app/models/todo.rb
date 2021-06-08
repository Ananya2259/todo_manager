class Todo < ActiveRecord::Base
  def self.overdue
    where("due_date < ? ", Date.today)
  end
  def self.duetoday
    where(due_date: Date.today)
  end
  def self.duelater
    where("due_date > ?", Date.today)
  end

  def self.completed
    where(completed: true)
  end

  def self.notcompleted
    where(completed: false)
  end
end
