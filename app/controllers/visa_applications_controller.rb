class VisaApplicationsController < ApplicationController
  before_action :set_step_id, only: [:show]
  skip_before_action :verify_authenticity_token

  # GET /visa_applications/:id
  def show
    @form = Form.find(params[:id])
    step_id = params[:step]
    @questions = @form.get_questions_by_step(step_id)
  end


  # POST /visa_applications/
  def create
    form = Form.find(params[:id])
    params.each do |key, value|
      if key.start_with?("question_")
        question_id = key[9..-1]
        Answer.create(:question_id => question_id, :answer => value)
      end
    end
    next_step = params[:step].to_i + 1
    new_questions = form.questions.where(["step = :next_step", {next_step: next_step}])
    if new_questions.blank?
      redirect_to action: "finished_form"
    else
      redirect_to action: "show", id: form.id, step: next_step
    end
  end

  def finished_form
  end


  private

  def set_step_id
    step_id = params[:step]
    unless step_id
      redirect_to action: "show", step: 1

    end
  end

end
