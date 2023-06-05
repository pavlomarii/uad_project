class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :unauthorized_if_not_current, only: %i[edit update destroy]

  def index
    @users = User.order(created_at: :desc)
  end

  def show; end

  def edit; end

  def update
    if @user.update(profile_params)
      redirect_to profile_path(@user), notice: 'Профіль оновлено!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to :root_path, notice: 'Ваш профіль було успішно видалено'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def unauthorized_if_not_current
    if @user != current_user
      redirect_to profile_path(@user), error: 'Ви не маєте доступу до цієї операції'
    end
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:user).permit(:name, :avatar)
  end
end