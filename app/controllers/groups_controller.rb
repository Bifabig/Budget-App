class GroupsController < ApplicationController
  before_action :set_groups, only: %i[show edit update destroy]

  def index
    @user = current_user
    if @user.nil?
      redirect_to user_session_path, flash: { alert: 'You must be signed in to continue.' }
    else
      @groups = @user.groups
    end
  end
end
