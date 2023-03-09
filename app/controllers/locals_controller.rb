class LocalsController < ApplicationController

  def show
    @local = Local.find(params[:id])
    @dog = Dog.where(params[:user_id])
  end

  def new
    @pub = Pub.find(params[:pub_id])
    @local = Local.new
  end

  def create
    @pub = Pub.find(params[:pub_id])
    @local = Local.new(local_params)
    @local.pub = @pub
    if @local.save
      redirect_to pub_path(@pub)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @local = Local.find(params[:id])
  end

  def update
    @local = Local.find(params[:id])
    @local.update(local_params)
    redirect_to locals_path(@local)
  end

  def destroy
    @local = Local.find(params[:id])
    @local.destroy
    redirect_to locals_path, status: :see_other
  end

  private

  def local_params
    params.require(:local).permit(:pub_id, :dog_id, :photo)
  end

end
