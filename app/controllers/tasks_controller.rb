class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create

    is_task =  params['task']
    count =  params['count']

    if is_task.nil?

      @task = Task.new(task_params)

      if @task.save

        users = User.pluck(:id)

        steps  = Step.all.where(rating: nil).pluck(:user_id)

        time = 0

        users.each do |id|
          break if time > 3
          if steps.exclude?(id)
            time += 1
            Step.create({task_id: @task.id,user_id: id})
          end
        end 

        if time == 3

          render json: @task, include: [:steps], status: :created, location: @task

        else

          id = @task.id

          render json: {
            message: "Solo se crearon #{time} pasos, ya que no hay mas usuarios libres",
            instructions:"use los siguentes parametros en su url 'task=#{ id }','count=#{time}' para asignar a usuarios no libres"
          }

        end
        
      else
        render json: @task.errors, status: :unprocessable_entity
      end 

    else

      users = User.pluck(:id)

      time = 4 - count.to_i

      time.times do |t|
        id = users.sample
        Step.create({task_id: is_task.to_i,user_id: id})
      end
      
      render json: {
        message: 'Tareas Creadas'
      }

    end  
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.permit(
        :title,
        :status,
        :result,
        :description
      )
    end
end
