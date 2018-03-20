class Admin::CategoriesController < ApplicationController
  before_action :set_categories, only: %i[index]
  before_action :set_category, only: %i[show edit update destroy]

  add_flash_types :success

  def new
    @category = Category.new
  end

  def index; end

  def show; end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to edit_admin_category_path(@category), { success: t('.update_successful', title: @category.title) }
    else
      render :edit
    end
  end

  def create
    category = Category.new(category_params)

    if category.save!
      redirect_to admin_categories_path, { success: t('.create_successful', title: category.title) }
    else
      render :new
    end
  end

  def destroy
    flash_message = if @category.destroy!
                      { success: t('.delete_successful', title: @category.title) }
                    else
                      { alert: t('.delete_failed', title: @category.title) }
                    end

    redirect_to admin_categories_path, flash_message
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :image)
  end
end
