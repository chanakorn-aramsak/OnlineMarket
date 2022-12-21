class UsersController < ApplicationController

  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :role, :authorization

  def authorization
    if (@myrole == 'admin')
    
    else
      redirect_to '/permission'
    end
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @editing = true
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if (User.where(email: "#{@user.email}") != [])
      p "This Email is already used."
      redirect_to '/users/new', notice: "This Email is already used."
    else
      respond_to do |format|
        # Book.where("title = #{params[:title]}")
        if @user.save
          format.html { redirect_to user_url(@user), notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if (User.where(email: "#{@user.email}") != [] && @user.email != User.find(params[:id]).email)
      redirect_to "/users/#{@user.id}/edit", notice: "Can not update. This Email is already used."
    else

      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if (@user.id == session[:user_id])
      redirect_to '/users', notice: 'Cannot delete yourself'
    else
      Inventory.where(user_id: @user.id).destroy_all
      Inventory.where(seller_id: @user.id).destroy_all
      Market.where(user_id: @user.id).destroy_all
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :name, :password, :user_type, :lock_version)
    end
end
