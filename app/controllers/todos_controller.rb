class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_parameters)
    todo.save
    redirect_to todos_path
  end

  private

    def todo_parameters
      params.require(:todo).permit(:title)
    end
end