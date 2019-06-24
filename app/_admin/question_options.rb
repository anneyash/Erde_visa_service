ActiveAdmin.register QuestionOption do
  permit_params :content, :question_id

  form do |f|
    f.input :content
    f.input :question_id, :as => :select, :collection => Question.all.map {|u| [u.title, u.id]}
    f.actions

  end
end
