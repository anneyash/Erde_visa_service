class Admin::Forms::QuestionsController < Admin::BaseController
  before_action :set_form
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /forms/1/questions
  # GET /forms/1/questions.json
  def index
    @questions = @form.questions.all.order('step, ordering')
  end


  # GET /forms/1/questions/1
  # GET /forms/1/questions/1.json
  def show
  end

  # GET /forms/1/questions/new
  def new
    @question = @form.questions.new
    @question.question_type = Question::STRING_INPUT
    @question.answers.build(answer: 'Да')
    @question.answers.build(answer: 'Нет')
  end

  # GET /forms/1/questions/1/edit
  def edit
  end

  # POST /forms/1/questions
  # POST /forms/1/questions.json
  def create
    filtered_params = filter_params(question_params)
    @question = @form.questions.new(filtered_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to admin_form_questions_path, notice: 'Вопрос успешно создан' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1/questions/1
  # PATCH/PUT /forms/1/questions/1.json
  def update
    filtered_params = filter_params(question_params)

    respond_to do |format|
      if @question.update(filtered_params)
        format.html { redirect_to admin_form_questions_path, notice: 'Вопрос успешно обновлен' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1/questions/1
  # DELETE /forms/1/questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to admin_form_questions_path, notice: 'Вопрос успешно удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:form_id])
    end

    def set_question
      @question = @form.questions.find(params[:id])
    end

    def filter_params(p)
      filtered = p
      if filtered[:question_type] == Question::STRING_INPUT || filtered[:DATE] == Question::DATE
        p.delete(:answers)
      end

      filtered[:placeholder] = '' if filtered[:DATE] == Question::DATE
      filtered
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(
        :title,
        :question_type,
        :created_at,
        :updated_at,
        :muted_text,
        :placeholder,
        :step,
        :ordering,
        :form_id,
        :has_optional_answer,
        :is_group_view,
        answers_attributes: [:answer, :_destroy, :id]
        )
    end
end
