class Admin::CreatedFormsController < Admin::BaseController
  # GET /questions
  # GET /questions.json
  def index
    @forms = Form.all
  end
end
