class Label < ApplicationRecord
  validates :name,
    presence: {message: "入力してください！"},
    length: { maximum: 30 }

  belongs_to :user, optional: true
  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labellings
  has_many :labelling_tasks, through: :labellings, source: :task
end
