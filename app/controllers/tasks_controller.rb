class TasksController < ApplicationController

# I coded task_controller.rb    
    
  def index
    if params[:search]
      @tasks = Task.searching(params[:search])
    else
      @tasks = Task.all.order("created_at")
    end
  end
    
  def new
  end          

  def create
    @task = Task.new(task_params) 
    @task.save
    redirect_to tasks_path
  end
 
private    
  def task_params
    params.require(:task).permit(:name, :complete, :due_date, :term)
  end
    
end
