class HealthController < ApplicationController
  def index
    render json: { status: 'Online' }, status: 200
  end
end
