class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  PER = 5

  # GET /tasks
  def index
    @tasks = Task.all
    # @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
    if logged_in?
      @tasks = current_user.tasks.all.order(created_at: :desc).page(params[:page]).per(PER)
    if params[:sort_expired]
      @tasks = Task.all.order(deadline: :desc).page(params[:page]).per(PER)
    end
    if params[:sort_rank]
      @tasks = Task.all.order(rank: :desc).page(params[:page]).per(PER)
    end
    if params[:title].present?
      @tasks = @tasks.get_by_title params[:title]
    end
    if params[:status].present?
      @tasks = @tasks.get_by_status params[:status]
    end
    if params[:label].present?
      @label_id = params[:label].to_i
      @labellings = Labelling.where(label_id: @label_id)
      @tasks = Task.where(id: @labellings.pluck(:task_id)).page(params[:page]).per(PER).where(user_id: current_user.id)
      # binding.irb
      # @tasks = @tasks.get_by_label params[:label]
      # puts @labellings
      # @labellings.each do |labelling|
      #   puts labelling.task_id
      # end
      # @tasks = @labellings.tasks
      # @tasks = Task.where(@labellings)
    end
    else
      redirect_to new_session_path
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
    @task = current_user.tasks.build(task_params)
    # label_list = params[:task][:label_name].split(",")
    if @task.save
      # @task.save_tasks(label_list)
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
      params.require(:task).permit(:title, :content, :rank, :deadline, :status, :user_id, { label_ids: [] })
    end
end
