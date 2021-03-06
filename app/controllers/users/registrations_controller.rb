class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, notice: 'ゲストユーザーは削除できません。'
    end
  end

  protected

  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end
end
