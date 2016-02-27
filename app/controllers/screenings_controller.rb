class ScreeningsController < ApplicationController
  
  def index
    render json: Screening.all.to_json
  end

end
