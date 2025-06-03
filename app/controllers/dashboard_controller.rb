class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @parties = current_user.parties.includes(participants: :guests)
  end
end
