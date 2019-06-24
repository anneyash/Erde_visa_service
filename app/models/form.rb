class Form < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_one :declaration, dependent: :destroy

  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :declaration, allow_destroy: true

  validates :title, presence: true

  def get_questions_by_step(current_step = 1)
    return self.questions.where(["step = :step", {step: current_step}])
  end
end
