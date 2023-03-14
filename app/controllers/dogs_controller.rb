class DogsController < ApplicationController

  def index
    @dogs = Dog.where(user: current_user)
    @dog = Dog.new
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new(params[:id])
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to dogs_path
    else
      redirect_to dogs_path
    end
  end
  # def create
  #   @dog = Dog.create(dog_params)
  #   if @dog.save!
  #     flash[:success] = 'Dog created successfully!'
  #     redirect_to dogs_path(@dog)
  #   else
  #     flash[:error] = 'ERROR: Activity was not saved!'
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dogs_path(@dog)
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dogs_path, status: :see_other
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :proffession, :age, :user_id, :photo)
  end

end
