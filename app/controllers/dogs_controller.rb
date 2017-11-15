class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]
  
  def index
    @dogs = Dog.all
  end
  
  def new
    @dog = Dog.new
  end
  
  def create
    @dog = Dog.new(dog_params)
    
    #if it saves go to the index
    if @dog.save
      redirect_to dogs_url, notice: 'Sucessfully saved.'
    else
      flash.now[:notice] = "Something went wrong.  We couldn't save your dog..."
      render :new
    end
  end
  def show
    @dog = Dog.find(params[:id])
    
  end
  def edit
    @dog = Dog.find(params[:id])
   
  end
  
  def update
    @dog = Dog.find(params[:id])
    
    if @dog.update(dog_params)
      redirect_to dog_url(@dog), notice: 'Sucessfully Updated'
    else
      flash.now[:notice] = "Something went wrong, your dog wasn't updated" #@(dog.name)"
      render :edit
    end
  end
  def destroy
    if @dog.destroy
      redirect_to dogs_url, notice: "Sucessfully deleted"
    else
      redirect_to dogs_url, notice: "Could not delete dog"
    end
    
  end

  private
  
  def dog_params
    params.require(:dog).permit(:name, :age, :breed, :owner)
  end
  def set_dog
    @dog = Dog.find(params[:id])
  end
end