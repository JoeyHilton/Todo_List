class ToDosController < ApplicationController
  def show
    @to_do = ToDo.find(params[:id])
  end

  def index
    @to_dos = ToDo.all
    @to_dos = @to_dos.order(:completed)
  end

  def new
    @to_do = ToDo.new
  end

  def create
    @to_do = ToDo.new(to_do_params)
    if @to_do.save
      redirect_to to_dos_path
    else
      render :new
    end
  end

  def edit
    @to_do = ToDo.find(params[:id])
  end

  def update
    @to_do = ToDo.find(params[:id])
    if @to_do.update(to_do_params)
      redirect_to to_dos_path
    else
      render :edit
    end
  end

  def destroy
    @to_do = ToDo.find(params[:id])
    @to_do.destroy
    redirect_to to_dos_path
  end

  private
  def to_do_params
    params.require(:to_do).permit(:title, :category, :priority, :completed)
    
  end
end
