class ScreeningsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: Screening.all.to_json
  end

  def filters
    render json: Screening.where(construct_query_string).to_json
  end

  private
  
  def construct_query_string
    str=''
    params[:attributes].each_with_index do |e, index|
    str += " and " if index != 0
    str += e[0].to_s
    str += " = " +"'" +e[1][:value] + "'" if e[1][:operator] == "is_equal_to"
    end
    str
  end
end
