class LocalsController < ApplicationController

  def show
    @local = Local.find(params[:id])
  end

  def new
    @local = Local.new(params[:id])
  end

  def create
    @local = Local.new(local_params)
    @local.user = current_user
    if @local.save
      redirect_to local_path(@local)
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
    params.require(:local).permit(:user_id, :dog_id)
  end
end
