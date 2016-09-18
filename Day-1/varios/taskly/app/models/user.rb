class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def as_json options = {}
    super(only: [:name, :email],
          methods: [:tasks_count,
                    :tasks_completed,
                    :tasks_pending],
          include: [tasks: {
                      only: [
                              :name,
                              :due_date
                            ]
                      }
                   ])
  end

  def tasks_count
    self.tasks.count
  end

  def tasks_completed
    self.tasks.select(:name).where completed: true
  end

  def tasks_pending
    self.tasks.select(:name).where completed: false
  end
end
