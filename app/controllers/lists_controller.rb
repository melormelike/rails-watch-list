class ListsController < ApplicationController
before_action :find_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "List was successfully created."
    else
      render :new
    end
  end

  def new
    @list = List.new
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
