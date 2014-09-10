class FriendListsController < ApplicationController
  before_action :set_friend_list, only: [:show, :edit, :update, :destroy]
  skip_authorize_resource
  # GET /friend_lists
  # GET /friend_lists.json
  def index
    @friend_lists = FriendList.all
  end

  # GET /friend_lists/1
  # GET /friend_lists/1.json
  def show
  end

  # GET /friend_lists/new
  def new
    @friend_list = FriendList.new
  end

  # GET /friend_lists/1/edit
  def edit
  end

  # POST /friend_lists
  # POST /friend_lists.json
  def create
    @friend_list = FriendList.new(friend_list_params)
    @users = User.where("username <> \"Administrator\" and id <> #{current_user.id}")
    @td_id = params[:friend_list][:td_id]
    begin
      if FriendList.where(request_user: params[:friend_list][:request_user], confirm_user: params[:friend_list][:confirm_user]).size > 0
        @result =0
        @message = "Waitting confirm!"
        return false
      end
      if @friend_list.save
          @result =1
          @message = "Send request to #{User.find(params[:friend_list][:confirm_user]).full_name} was successfully!"
      else
        @result =0
        @message = "Send request to #{User.find(params[:friend_list][:confirm_user]).full_name} was error!"
      end
    @total_confirm = FriendList.where(confirm_user: @friend_list.confirm_user.to_i, is_confirm: 0).size > 0 ? FriendList.where(confirm_user: @friend_list.confirm_user.to_i, is_confirm: 0).size : 0
    else
      @result =0
      @message = "Some thing is error!"
    end
  end

  # PATCH/PUT /friend_lists/1
  # PATCH/PUT /friend_lists/1.json
  def update
    respond_to do |format|
      if @friend_list.update(friend_list_params)
        format.html { redirect_to @friend_list, notice: 'Friend list was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend_list }
      else
        format.html { render :edit }
        format.json { render json: @friend_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_lists/1
  # DELETE /friend_lists/1.json
  def destroy
    @friend_list.destroy
    respond_to do |format|
      format.html { redirect_to friend_lists_url, notice: 'Friend list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm_list
    @confirm_lists = FriendList.where(confirm_user: current_user.id, is_confirm: 0)
    @users  = []
    @confirm_lists.each do |frl|
      user = User.find(frl.request_user)
      temp = {}
      temp[:id]= user.id
      temp[:full_name] = user.full_name
      temp[:username] = user.email
      temp[:address] = user.address
      temp[:friend_list_id] = frl.id
      @users << Hashie::Mash.new(temp)
    end
  end

  def confirm
    confirm_id = params[:confirm_id]
    @td_id = params[:td_id]
    begin
      if FriendList.find(confirm_id).update(is_confirm: 1)
        @request_user = FriendList.find(confirm_id).request_user
        @result =1
        @message = "Confirm success!"
        @total_confirm = FriendList.where(confirm_user: current_user.id, is_confirm: 0).size > 0 ? FriendList.where(confirm_user: current_user.id, is_confirm: 0).size : 0
      else
        @result =0
        @message = "Failed!"
      end
    rescue
      @result =0
      @message = "Some thing is error!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_list
      @friend_list = FriendList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_list_params
      params.require(:friend_list).permit(:request_user, :confirm_user, :is_confirm)
    end
end
