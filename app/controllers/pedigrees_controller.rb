class PedigreesController < ApplicationController
  before_action :set_pedigree, only: [:show, :edit, :update, :destroy]

  def index
    @pedigrees = Pedigree.all
  end

  def new
    @pedigree = Pedigree.new
  end

  def edit
  end

  def create
    @pedigree = Pedigree.new(pedigree_params)

    if @pedigree.save
      redirect_to action: 'index', notice: 'Pedigree was successfully created.' 
    else
      render action: 'new' 
    end
  end

  def update
    if @pedigree.update(pedigree_params)
      redirect_to @pedigree, notice: 'Pedigree was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pedigree.destroy
    redirect_to pedigrees_url
  end

  private
    def set_pedigree
      @pedigree = Pedigree.find(params[:id])
    end

    def pedigree_params
      params.require(:pedigree).permit(:name)
    end
end
