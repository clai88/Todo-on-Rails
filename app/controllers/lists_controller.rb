class ListsController < ApplicationController
  def index
    @lists = List.all.find(session[:user_id])
  end

  def create
    @list = List.create(list_params)
    @list.update(user_id: session[:user_id])

    redirect_to "/lists"
  end

  def new
    @list = List.new
  end

  def show_list
    @list = List.all.find(params["name"])
  end


  private def list_params
    params.require("list").permit(:name)
  end
end
