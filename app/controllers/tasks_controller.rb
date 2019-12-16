class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  PER = 5

  # GET /tasks
  def index
    @tasks = Task.all
    @tasks = Task.order(created_at: :desc)
    @tasks = Task.page(params[:page]).per(5)
    if params[:sort_expired]
      @tasks = Task.all.order(deadline: :desc)
    end
    if params[:sort_rank]
      @tasks = Task.all.order(rank: :desc)
    end
    if params[:title].present?
      @tasks = @tasks.get_by_title params[:title]
    end
    if params[:status].present?
      @tasks = @tasks.get_by_status params[:status]
    end
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:title, :content, :rank, :deadline, :status)
    end
end
