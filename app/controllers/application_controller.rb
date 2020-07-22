class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: 
      [:nickname, :family_name, :first_name, :kana_family_name, :kana_first_name,
      :birth_year, :birth_month, :birth_day, :zip_code,
      :prefecture, :municipality, :address, :apartment_name, :phone_num])
  end
end
