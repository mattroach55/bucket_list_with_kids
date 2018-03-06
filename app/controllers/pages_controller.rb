class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]
  def home
  end
end
