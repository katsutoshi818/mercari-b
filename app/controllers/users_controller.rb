class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

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
end
