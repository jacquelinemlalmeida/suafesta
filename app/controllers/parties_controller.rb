class PartiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @parties = current_user.parties.order(scheduled_at: :desc)
  end

  def show
    @party = current_user.parties.find(params[:id])
  end

  # outros métodos como new, create, edit, etc.
end
