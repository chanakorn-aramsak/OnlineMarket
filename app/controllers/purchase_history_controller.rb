class PurchaseHistoryController < ApplicationController
  before_action :is_logined
  before_action :role, :authorization
  def authorization
    if (@myrole == 'admin' || @myrole == 'buyer')
    
    else
      redirect_to '/permission'
    end
  end
  
  def index
    @myItem = Inventory.where(user_id: session[:user_id]).all
  end
end
