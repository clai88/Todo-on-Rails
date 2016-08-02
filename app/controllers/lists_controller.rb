class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    @list = List.new
  end
end
