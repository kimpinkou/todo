class TasksController < ApplicationController
  before_action :find_task, :only => [:show, :edit, :update, :destroy, :done]

  def unclosed
    @tasks = Task.unclosed
    render :action => "index"
  end

  def done
    # render :plain => "doneです"
    @task.update(:status => true)
    redirect_to tasks_path
  end

  def index
    @name = params[:name]
    @tasks = Task.search(@name)
  end

  def show
    # render :plain => "task controllerのshow actionです"
  end

  def new
    @task = Task.new(:status => false)
  end

  def edit
    # render :plain => "editです"
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task),:notice => "タスクを登録しました。"
    else
      render :action => "new"
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task),:notice => "タスクを更新しました。"
    else
      render :action => "edit"
    end
  end

  def destroy
  @task.destroy
  redirect_to tasks_path, :alert => "タスクを削除しました。"
  end


  private
  def task_params
    params.require(:task).permit(:name,:deadline,:status)
  end

  def find_task
    @task =Task.find(params[:id])
  end
end
