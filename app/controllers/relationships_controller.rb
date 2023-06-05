class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_other_user

  def create
    current_user.follow(@other_user)
    redirect_back fallback_location: root_path, notice: "Ви підписались на #{@other_user.name}!"
  end

  def destroy
    current_user.unfollow(@other_user)
    redirect_back fallback_location: root_path, notice: "Ви відписались від #{@other_user.name}!"
  end

  private

  def set_other_user
    @other_user = User.find(params[:other_user_id])
  end
end
