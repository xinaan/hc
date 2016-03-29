class SettingsController < ApplicationController
  layout 'admin'
  before_action :set_setting, only: [ :edit, :update]
  before_filter :confirm_logged_in, only: :edit
  def edit

  end

  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to edit_setting_path(@setting), notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @settings.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:title, :jheader, :jtext, :lbook, :lform, :deadline, :intro, :alert)
  end

  def set_setting
    @setting = Setting.find(1)
  end
end
