class Question < ApplicationRecord

  STRING_INPUT = "string_input"
  DATE = "date"
  RADIOBUTTON_CHOICE = "radiobutton_choice"
  RADIOBUTTON_CHOICE_WITH_INPUT = "radiobutton_choice_with_input"

  QUESTION_TYPES = [STRING_INPUT, DATE, RADIOBUTTON_CHOICE, RADIOBUTTON_CHOICE_WITH_INPUT]
  QUESTION_TYPE_CHOICE = [
    ["String input", STRING_INPUT],
    ["Date", DATE],
    ["Radiobutton choice", RADIOBUTTON_CHOICE],
    ["Radiobutton choice with input", RADIOBUTTON_CHOICE_WITH_INPUT]
  ]

  QUESTION_TYPE_CHOICE_RU = [
    ["Обычное поле", STRING_INPUT],
    ["Дата", DATE],
    ["Радиокнопка", RADIOBUTTON_CHOICE],
    ["Радиокнопка c доп. полем", RADIOBUTTON_CHOICE_WITH_INPUT]
  ]

  has_many :question_options, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  belongs_to :form

  validates :title, presence: true
  validates :question_type, presence: true
end
