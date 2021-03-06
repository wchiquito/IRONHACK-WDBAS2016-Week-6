class TasksController < ApplicationController
  skip_before_action :is_logged_in?, only: [:new, :create]
  before_action :current_user_is_the_owner, only: [:edit, :update, :destroy]

  # GET /tasks
  def index
    #@tasks = Task.all
    #if logged_in?
      @tasks = current_user.tasks
    #else
    #  redirect_to login_path
    #end
  end

  # GET /tasks/1
  def show
    @task = Task.find params[:id]
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    #@task = Task.find params[:id]
    if @task.user_id = @user_id

    end
  end

  # POST /tasks
  def create
    @task = Task.new task_params

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    #@task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    #@task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :due_date, :completed, :user_id)
    end

    def current_user_is_the_owner
      @task = Task.find params[:id]
      unless current_user.id == @task.user_id
        redirect_to tasks_path, notice: 'Access forbidden.'
      end
    end
end
