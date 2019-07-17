# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
    @user = User.new
    @user.build_profile
    @user.build_addressee
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    @user.profile.birthday = user_params[:profile_attributes][:'birthday(1i)'] + user_params[:profile_attributes][:'birthday(2i)'] +  user_params[:profile_attributes][:'birthday(3i)']
    if @user.save
      sign_in @user
      redirect_to new_card_path(current_user.id)
    else
      redirect_to action: "new"
    end
  end

  def thanks
    @user = User.new
    sign_in @user
    # redirect_to user_path(current_user.id)
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super
  #   # redirect_to users_path(@user)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   users_thanks_path
  # end


  private

  def user_params
    params.require(:user).permit(:nickname, :phone_number, :email, :password, :password_confirmation, profile_attributes:[:first_name, :last_name, :first_name_katakana, :last_name_katakana, :birthday, :postal_code, :prefecture, :city, :address, :building, :introduction, :avatar, :point], addressee_attributes:[:first_name, :last_name, :first_name_katakana, :last_name_katakana, :postal_code, :prefecture_id, :city, :address, :building, :phonenumber])
  end
  
end
