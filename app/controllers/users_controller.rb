class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 以下ページネーションのために.pate(params[:page])を追加
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
