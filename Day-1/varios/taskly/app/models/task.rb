class Task < ApplicationRecord
  belongs_to :user

  def as_json options = {}
    super(only: [:name, :due_date, :completed])
  end

  def tasks_completed
    self.completed = true
  end

  def tasks_pending
    self.where completed: false
  end

  def complete!
    self.completed = true
    self.save
  end
end
