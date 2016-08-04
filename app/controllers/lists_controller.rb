class ListsController < ApplicationController
  def index
    @lists = List.where(user_id: session[:user_id])
  end

  def create
    @list = List.create(list_params)
    @list.update(user_id: session[:user_id])

    redirect_to "/lists"
  end

  def new
    @list = List.new
  end

  def show
    @list = List.all.find_by(name: params["name"])
    @tasks = Task.where(list_id: @list.id)
    @task = Task.new

  end

  def new_task
    @list = List.all.find_by(name: params["name"])
    @task = Task.create(task_params)

    @task.update(list_id: @list.id)

    redirect_to "/lists/#{params["name"]}"
  end

  def random
    @task = Task.all.sample
  end

  def search
    @task = Task.new

    @query = params[:q]
    @lists = List.where(user_id: session[:user_id])

    @matched_list_items = List.all.select { |i| i.name.include? @query }
    @matched_task_items = Task.all.select { |i| i.name.include? @query }
  end

  private def list_params
    params.require("list").permit(:name)
  end

  private def task_params
    params.require("task").permit(:name)
  end
end
