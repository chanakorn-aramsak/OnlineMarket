class TopSellerController < ApplicationController
  before_action :is_logined
  before_action :role, :authorization

  def authorization
    if (@myrole == 'admin' || @myrole == 'seller')
    
    else
      redirect_to '/permission'
    end
  end

  def index
    @status = params[:status]
    if (@status == '')
      @status = 'blank'
    else
      # Person.group(:last_name).having("min(age) > 17").minimum(:age)
      # @seller_qty = User.where(user_type: 1).order('ratings DESC').all
      # Job.group(:user_id).select('SUM(total_days) as tot').order('tot desc')
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @seller_qty = Inventory.where('created_at BETWEEN ? AND ?', @start_date, @end_date).group(:seller_id).select('seller_id, SUM(qty) as qtyy').order('qtyy desc')
      @seller_totalPrice = Inventory.where('created_at BETWEEN ? AND ?', @start_date, @end_date).group(:seller_id).select('seller_id, SUM(qty*price) as qtyy').order('qtyy desc')
    end
  end

  def calculate
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    if (@start_date <= @end_date)
      redirect_to "/top_seller/ok/#{@start_date}/#{@end_date}"
    else
      redirect_to '/top_seller', notice: 'วันเริ่มต้นต้อง "น้อยกว่า" วันสิ้นสุด'
    end
  end
end
