class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :due_date, presence: true
  validates :todo_text, length: { minimum: 2 }
  belongs_to :user
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

  def self.of_user(user)
    all.where(user_id: user.id)
  end
end
