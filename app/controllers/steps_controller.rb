class StepsController < ApplicationController
  before_action :set_step, only: [:show, :update, :destroy]

  # GET /steps
  def index
    @steps = Step.all

    render json: @steps
  end

  # GET /steps/1
  def show
    render json: @step
  end

  # POST /steps
  def create
    @step = Step.new(step_params)

    if @step.save
      render json: @step, status: :created, location: @step
    else
      render json: @step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /steps/1
  def update
    if @step.update(step_params)

      steps = Step.all.where(task_id: @step.task_id).where.not(rating: nil)

      if steps.length() == 4

        current = 0
        
        steps.each do |s|
          current += s.rating.to_i
        end

        total = current/4

        result = ""

        if total <= 2
          result = "No confiable"
        elsif total >= 5
          result = "Confiable"
        else
          result = "Confiable con obsevaciones" 
        end

        Task.where(id: @step.task_id).update_all(status: 'completa',result: result)
      end
      render json: @step
    else
      render json: @step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /steps/1
  def destroy
    @step.destroy
  end

  def steps_for_me
    @id = current_user.id
    steps = Step.all.where(user_id: @id).where(rating: nil)
    render json: steps
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def step_params
      params.permit(
        :comment,
        :rating,
        :user_id,
        :task_id
      )
    end
end
