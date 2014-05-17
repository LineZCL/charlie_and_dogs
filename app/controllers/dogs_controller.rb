class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search_pedigree]      
      @dogs = Dog.find_by_pedigree(params[:search_pedigree])
    else
      @dogs = Dog.all
    end
  end

  def new
    @dog = Dog.new
  end

  def edit
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to action: 'index', notice: 'Dog was successfully created.'
      
    else
       render action: 'new'
    end
    
  end

  def update
    if @dog.update(dog_params)
      redirect_to action: 'index', notice: 'Dog was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_url
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:name, :age, :photo, :description, :price, :pedigree_id, :search_pedigree)
    end
end
