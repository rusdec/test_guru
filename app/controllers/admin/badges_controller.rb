class Admin::BadgesController < Admin::BaseController
  before_action :set_badges, only: %i[index]
  before_action :set_badge, only: %i[edit updatei destroy show]

  add_flash_types :success

  def new
    @badge = Badge.new
  end

  def edit
  end

  def destroy
    flash_message = if @badge.destroy
                      { success: t('.destroy_success', title: @badge.title) }
                    else
                      { alert: t('.destroy_failed', title: @badge.title) }
                    end

    redirect_to admin_badges_path, flash_message
  end

  def create
    badge = Badge.new(badge_params)

    if badge.save!
      redirect_to admin_badges_path, { success: t('.update_success', title: badge.title) }
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, { success: t('.update_success', title: @badge.title) }
    else
      render :edit
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:image, :title, :is_active, :description, :rule)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_badges
    @badges = Badge.all
  end
end
