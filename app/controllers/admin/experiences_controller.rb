class Admin::ExperiencesController < ApplicationController
  def index
    @experiences = current_user.experiences
  end
end
