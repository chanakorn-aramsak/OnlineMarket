class MarketsController < ApplicationController
  before_action :is_logined
  before_action :set_market, only: %i[ show edit update destroy ]
  before_action :role
  before_action :authorization, only: %i[ index ]
  #before_action :authorization, except: [:edit, :show]

  def authorization
    if (@myrole == 'admin')
    
    else
      redirect_to '/permission'
    end
  end
  # GET /markets or /markets.json
  def index
    @markets = Market.all
  end

  # GET /markets/1 or /markets/1.json
  def show
  end

  # GET /markets/new
  def new
    @market = Market.new
    @editing = false
  end

  # GET /markets/1/edit
  def edit
    @editing = true
  end

  # POST /markets or /markets.json
  def create
    @market = Market.new(market_params)
    if ( User.where(id: @market.user_id) == [] )
      p "======"
      p @market.user_id
      redirect_to "/markets/new", notice: "Invalid user_id. Please try agian."
    elsif ( Item.where(id: @market.item_id) == [] )
      redirect_to "/markets/new", notice: "Invalid item_id. Please try agian."
    else
      respond_to do |format|
        if @market.save
          format.html { redirect_to market_url(@market), notice: "Market was successfully created." }
          format.json { render :show, status: :created, location: @market }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @market.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /markets/1 or /markets/1.json
  def update
    respond_to do |format|
      if @market.update(market_params)
        format.html { redirect_to market_url(@market), notice: "Market was successfully updated." }
        format.json { render :show, status: :ok, location: @market }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @market.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /markets/1 or /markets/1.json
  def destroy
    @market.destroy

    respond_to do |format|
      format.html { redirect_to markets_url, notice: "Market was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market
      @market = Market.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def market_params
      params.require(:market).permit(:user_id, :item_id, :price, :stock, :lock_version)
    end
end
