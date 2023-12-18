class Admin::TrainingMenusController < ApplicationController
  before_action :set_training_menu, only: %i[edit update destroy]
  def index
    @training_menus = TrainingMenu.all
  end

  def new
    @training_menu = TrainingMenu.new
  end

  def edit
  end

  private
  def set_training_menu
    @training_menu = TrainingMenu.find(params[:id])
  end
end
