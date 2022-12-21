class MainController < ApplicationController
  before_action :is_logined
  before_action :role
  def index
  end
  
  def permission
  end
end
