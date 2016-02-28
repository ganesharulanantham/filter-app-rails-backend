class ScreeningsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    render json: Screening.all
                  .order(order_by)
                  .limit(params[:limit]).offset(params[:offset])
  end

  def filters
    render json: Screening.where(construct_query_string)
                  .order(order_by)
                  .limit(params[:limit]).offset(params[:offset])
  end

  def options
    render json: Screening.select('id' + ',' + params[:key] + ' as text')
                  .where(params[:key] + " LIKE ?" , "%#{params[:value]}%").group(params[:key])
                  .order(order_by)
                  .limit(params[:limit]).offset(params[:offset]), :root => false
  end

  private

  def sanitize str
    ActiveRecord::Base.connection.quote(str)
  end

  def order_by
    sort_by + direction
  end

  def sort_by
    params[:sort_by] || ''
  end

  def direction
    params[:direction] || ''
  end

  def get_operator condition
    return " = " if condition == "is_equal_to"
    return " != " if condition == "is_not_equal_to"
  end

  def get_condition(key, operator, value)
    key + get_operator(operator) + sanitize(value)
  end

  def construct_query_string
    return if params[:attributes].blank?
    str=''
    params[:attributes].each_with_index do |e, index|
    str += " #{e[1][:condition]} " if index != 0
    str += get_condition(e[0].to_s, e[1][:operator], e[1][:value])
    end
    str
  end
end
