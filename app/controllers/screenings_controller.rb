class ScreeningsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: Screening.all
  end

  def filters
    # Must handle the mysql error with single quotes
    render json: Screening.where(construct_query_string)
  end

  def options
    # Screening.where("title LIKE ?" , "%#{"s"}%")
    # Screening.select('title, id').where("title LIKE ?" , "%#{"s"}%").group('title')
    render json: Screening.select('id' + ',' + params[:key] + ' as text').where(params[:key] + " LIKE ?" , "%#{params[:value]}%").group(params[:key]), :root => false
  end

  private

  def construct_query_string
    return if params[:attributes].blank?
    str=''
    params[:attributes].each_with_index do |e, index|
    str += " and " if index != 0
    str += e[0].to_s
    str += " = " +"'" +e[1][:value] + "'" if e[1][:operator] == "is_equal_to"
    end
    str
  end
end
