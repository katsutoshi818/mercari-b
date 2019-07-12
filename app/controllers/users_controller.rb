class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_category_brand, only: [:show, :profiles, :logout, :identification, :deliver_address, :email, :card, :password]

  def index
  end

  def profiles
  end

  def logout
  end

  def identification
  end

  def deliver_address
  end

  def email
  end

  def card
  end

  def password
  end

  private

  def set_category_brand
    @brands = Brand.all
    @parents = Category.where(ancestry: nil)
    @parent = Category.find_by('category_name LIKE(?)', "%#{params[:keyword]}%")
    @children = @parent.children
    respond_to do |format|
      format.json
      format.html
    end
  end
end
