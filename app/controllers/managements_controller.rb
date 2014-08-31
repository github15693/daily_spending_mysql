class ManagementsController < ApplicationController

  def index
    session[:body_tab]=:spending
    @expiry_date = get_expiry_date
  end

  def add_goods
    session[:body_tab]=:add_goods
    @good = Good.new
    @goods = Good.all
  end

  def update_expiry_date
    date = params[:date].to_date()
    begin
      if DateExpiry.last.blank?
        DateExpiry.create(date_expiry: date)
        return render json: {message: 'Create expiry date success!'}
      else
        DateExpiry.last.update(date_expiry: date)
        return render json: {message: 'Update expiry date success!'}
      end
    end
  rescue
    return render json: {message: 'Error!'}
  end


  private
  def get_expiry_date
    if DateExpiry.last.blank?
      DateExpiry.create(date_expiry: Time.now + 7.days)
      return Time.now + 7.days
    else
      return DateExpiry.last.date_expiry
    end
  end

end
