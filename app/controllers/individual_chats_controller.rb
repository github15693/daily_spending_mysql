class IndividualChatsController < ApplicationController
  before_action :set_individual_chat, only: [:show, :edit, :update, :destroy]
  skip_authorize_resource
  # GET /individual_chats
  # GET /individual_chats.json
  def index
    @individual_chats = IndividualChat.all
  end

  # GET /individual_chats/1
  # GET /individual_chats/1.json
  def show
  end

  # GET /individual_chats/new
  def new
    @individual_chat = IndividualChat.new
  end

  # GET /individual_chats/1/edit
  def edit
  end

  # POST /individual_chats
  # POST /individual_chats.json
  def create
    @individual_chat = IndividualChat.new(individual_chat_params)
      if @individual_chat.save
        @sending_user = @individual_chat.sending_user
        @receiving_user = @individual_chat.receiving_user
        @result =1
      else
        @result =0
      end
  end

  # PATCH/PUT /individual_chats/1
  # PATCH/PUT /individual_chats/1.json
  def update
    respond_to do |format|
      if @individual_chat.update(individual_chat_params)
        format.html { redirect_to @individual_chat, notice: 'Individual chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @individual_chat }
      else
        format.html { render :edit }
        format.json { render json: @individual_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individual_chats/1
  # DELETE /individual_chats/1.json
  def destroy
    @individual_chat.destroy
    respond_to do |format|
      format.html { redirect_to individual_chats_url, notice: 'Individual chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def open_chat_box
    begin
      sending_user = params[:sending_user].to_i.blank? ? 0: params[:sending_user].to_i
      receiving_user = params[:receiving_user].to_i.blank? ? 0: params[:receiving_user].to_i
      # if IndividualChat.where(sending_user: sending_user, receiving_user: receiving_user).size > 0 || IndividualChat.where(sending_user: receiving_user, receiving_user: sending_user).size > 0
      #   @contents = IndividualChat.where("(sending_user=#{sending_user} and receiving_user=#{receiving_user}) or (sending_user=#{receiving_user} and receiving_user=#{sending_user})")
      #   @chat_with_user_name = User.find(receiving_user).full_name.blank? ? User.find(receiving_user).username.truncate(16, separator:' ') : User.find(receiving_user).full_name.truncate(16)
      #   @chat_with_user_id = User.find(receiving_user).id
      #   @my_name = User.find(sending_user).full_name.blank? ? User.find(sending_user).username.truncate(16, separator:' ') : User.find(sending_user).full_name.truncate(16)
      #   @my_id = User.find(sending_user).id
      #   return @result=1
      # else
        @contents = IndividualChat.where("(sending_user=#{sending_user} and receiving_user=#{receiving_user}) or (sending_user=#{receiving_user} and receiving_user=#{sending_user})")
        @chat_with_user_name = User.find(receiving_user).full_name.blank? ? User.find(receiving_user).username.truncate(16, separator:' ') : User.find(receiving_user).full_name.truncate(16)
        @chat_with_user_id = User.find(receiving_user).id
        @my_name = User.find(sending_user).full_name.blank? ? User.find(sending_user).username.truncate(16, separator:' ') : User.find(sending_user).full_name.truncate(16)
        @my_id = User.find(sending_user).id
        return  @result=1
      # end
    rescue
      return  @result=2
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_chat
      @individual_chat = IndividualChat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def individual_chat_params
      unless params[:individual_chat][:message].blank?
        params[:individual_chat][:message] = encrypt params[:individual_chat][:message]
      end
      params.require(:individual_chat).permit(:sending_user, :receiving_user, :message)
    end
end
