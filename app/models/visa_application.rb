class VisaApplication < ApplicationRecord
  belongs_to :country
  belongs_to :user
  has_many :questions, foreign_key: :question_id
  has_many :answers, foreign_key: :answer_id
end
