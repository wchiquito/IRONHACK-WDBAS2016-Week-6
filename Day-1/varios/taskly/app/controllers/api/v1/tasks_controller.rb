class Api::V1::TasksController < ApplicationController
  def index
    user = User.find_by id: params[:user_id]
    unless user
      render json: { error: 'user not found' },
                   status: 404
      return
    end
    tasks = user.tasks
    render json: tasks
  end

  def create
    user = User.find_by id: params[:user_id]
    unless user
      render json: { error: 'user not found' },
                   status: 404
      return
    end
    task = user.tasks.create tasks_params
    render json: task
  end

  def show
    user = User.find_by id: params[:user_id]
    unless user
      render json: { error: 'user not found' },
                   status: 404
      return
    end
    task = user.tasks.find_by id: params[:id]
    unless task
      render json: { error: 'task not found' },
                   status: 404
      return
    end
    render json: task
  end

  def delete
    user = User.find_by id: params[:user_id]
    unless user
      render json: { error: 'user not found' },
                   status: 404
      return
    end
    task = user.tasks.find_by id: params[:id]
    unless task
      render json: { error: 'task not found' },
                   status: 404
      return
    end
    task.destroy
    render json: task
  end

  def complete
    user = User.find_by id: params[:user_id]
    unless user
      render json: { error: 'user not found' },
                   status: 404
      return
    end
    task = user.tasks.find_by id: params[:id]
    unless task
      render json: { error: 'task not found' },
                   status: 404
      return
    end
    task.complete!
    render json: task
  end

  private

  def tasks_params
    params.require(:task).permit :name,
                                 :due_date
  end
end