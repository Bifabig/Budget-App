class EntitiesController < ApplicationController
  before_action :set_entities, only: %i[show edit update destroy]

  def index
    @user = current_user
    if @user.nil?
      redirect_to user_session_path, flash: { alert: 'You must be signed in to continue.' }
    else
      @entities = @user.entities
    end
  end
end
