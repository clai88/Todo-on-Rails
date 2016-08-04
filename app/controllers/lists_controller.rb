class ListsController < ApplicationController
  def index
    @lists = List.where(user_id: session[:user_id])

    @tasks = Task.all

    #hard mode
    @completed = @tasks.select { |t| t.is_completed != nil }

    @today_task = @completed.select {|comp| comp.is_completed == Date.today}
    @week_task = @completed.select {|comp| comp.is_completed >= Date.today - 1.week}
    @month_task = @completed.select {|comp| comp.is_completed >= Date.today - 1.month}
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
    @tasks = Task.where("name LIKE ?", "%#{params[:q]}%")
    # @task = Task.new
    # @query = params[:q]
    # @lists = List.where(user_id: session[:user_id])
    # @tasks = Task.where(list_id: @lists.id)
    #
    # @matched_list_items = @lists.all.select { |i| i.name.include? @query }
    # @matched_task_items = @tasks.all.select { |i| i.name.include? @query }
  end

  private def list_params
    params.require("list").permit(:name)
  end

  private def task_params
    params.require("task").permit(:name)
  end
end
