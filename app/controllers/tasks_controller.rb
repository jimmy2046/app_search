class TasksController < ApplicationController

#  def index
#    @tasks = if params[:term]
#      Task.where('lower(name) LIKE ?', "%#{params[:term]}%".downcase)
#    else
#      Task.all
#    end
#  end

#  def index
#    @tasks = if params[:search]
#      Task.where('lower(name) LIKE ? OR
#                  lower(complete) LIKE ? OR
#                  lower(due_date) LIKE ? OR
#                  lower(term) LIKE ?', 
#                  "%#{params[:search]}%".downcase, 
#                  "%#{params[:search]}%".downcase,
#                  "%#{params[:search]}%".downcase,
#                  "%#{params[:search]}%".downcase).order('created_at DESC')
#    else
#      Task.all
#    end
#  end    

  def index
    @tasks = Task.searching(params[:search])
  end
    
  def new
  end          

  def create
    @task = Task.new(task_params)
 
    @task.save
    redirect_to tasks_path
  end
 
private
#  def task_params
#    params.require(:task).permit(:name, :complete, :due_date, :term)
#  end    

def task_params
  params.require(:task).permit(:name, :complete, :due_date, :term)
end
    
end
