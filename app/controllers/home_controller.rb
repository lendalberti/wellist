class HomeController < ApplicationController


  # get my wellist
  def show
    @my_wellist = params['id'].present? ? Wellist.where(user_id: params['id']) : nil
    @public_wellist = Wellist.where(public_list: true).where(public_vendor: true)
    @users = User.all
  end




end
