class ManagementsController < ApplicationController

  def index
    session[:body_tab]=:spending
  end

  def add_goods
    session[:body_tab]=:add_goods
    @good = Good.new
    @goods = Good.all
  end

end
