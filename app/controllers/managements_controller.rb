class ManagementsController < ApplicationController

  def index
    session[:body_tab]=:spending
    if Statistic.last.blank?
      @statistic = Statistic.create()
      DateExpiry.create(statistic_id: @statistic.id, date_expiry: Time.now + 7.days)
    else
      @statistic = Statistic.last
    end
  end

  def add_goods
    session[:body_tab]=:add_goods
    @good = Good.new
    @goods = Good.all
  end

  def update_money_init
    begin
      id = params[:id].to_i
      money = params[:money].to_f
      if !params[:money].to_f
        return render json: {result: 0, message: 'Kind of value incorrect!'}
      else
        money_remain = money - Statistic.find(id).money_payment
        if Statistic.find(id).update(money_init: money, money_remain:money_remain)
          return render json: {result: 1, message: "Update was success! Value:#{money}",money_remain:money_remain}
        else
          return render json: {result: 0, message: "Cann't update! Value:#{money}"}
        end
      end
    rescue
      return render json: {result: 0, message: 'Error'}
    end
  end

  def update_expiry_date
    begin
      date = params[:date].to_date()
      id = params[:id].to_i
      if DateExpiry.last.blank?
        DateExpiry.create(date_expiry: date)
        return render json: {message: 'Create expiry date success!'}
      else
        if date.blank?
          return render json: {message: 'Date is null!'}
        else
          DateExpiry.find(id).update(date_expiry: date)
          return render json: {message: 'Update expiry date success!'}
        end
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
