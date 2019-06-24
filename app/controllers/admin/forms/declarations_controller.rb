class Admin::Forms::DeclarationsController < Admin::BaseController
  before_action :set_form
  before_action :set_declaration, only: [:show, :edit, :update, :destroy]


  # GET /forms/1/declarations/1
  # GET /forms/1/declarations/1.json
  def show
  end

  # GET /forms/1/declarations/new
  def new
    @declaration = Declaration.new
    @declaration.form = @form
  end

  # GET /forms/1/declarations/1/edit
  def edit
  end

  # POST /forms/1/declarations
  # POST /forms/1/declarations.json
  def create
    # @declaration = @form.declaration.new(declaration_params)
    @declaration = Declaration.new(declaration_params)
    @declaration.form_id = params[:form_id]

    respond_to do |format|
      if @declaration.save
        format.html { redirect_to admin_form_questions_path(@form), notice: 'Вопрос успешно создан' }
        format.json { render :show, status: :created, location: @declaration }
      else
        format.html { render :new }
        format.json { render json: @declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1/declarations/1
  # PATCH/PUT /forms/1/declarations/1.json
  def update
    respond_to do |format|
      if @declaration.update(declaration_params)
        format.html { redirect_to admin_form_questions_path(@form), notice: 'Вопрос успешно обновлен' }
        format.json { render :show, status: :ok, location: @declaration }
      else
        format.html { render :edit }
        format.json { render json: @declaration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1/declarations/1
  # DELETE /forms/1/declarations/1.json
  def destroy
    @declaration.destroy
    respond_to do |format|
      format.html { redirect_to admin_form_questions_path(@form), notice: 'Вопрос успешно удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:form_id])
    end

    def set_declaration
      @declaration = @form.declaration
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def declaration_params
      params.require(:declaration).permit(
        :title,
        :body,
        :step,
        )
    end
end
