class TodosController < ApplicationController
  before_filter :authenticate
  
  def index
    @todos = Todo.where(email: session[:current_email])
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_parameters.merge(email: session[:current_email]))
    todo.save
    redirect_to todos_path
  end

  private

    def todo_parameters
      params.require(:todo).permit(:title)
    end
end