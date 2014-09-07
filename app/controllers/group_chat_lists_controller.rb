class GroupChatListsController < ApplicationController
  before_action :set_group_chat_list, only: [:show, :edit, :update, :destroy]

  # GET /group_chat_lists
  # GET /group_chat_lists.json
  def index
    @group_chat_lists = GroupChatList.all
  end

  # GET /group_chat_lists/1
  # GET /group_chat_lists/1.json
  def show
  end

  # GET /group_chat_lists/new
  def new
    @group_chat_list = GroupChatList.new
  end

  # GET /group_chat_lists/1/edit
  def edit
  end

  # POST /group_chat_lists
  # POST /group_chat_lists.json
  def create
    @group_chat_list = GroupChatList.new(group_chat_list_params)

    respond_to do |format|
      if @group_chat_list.save
        format.html { redirect_to @group_chat_list, notice: 'Group chat list was successfully created.' }
        format.json { render :show, status: :created, location: @group_chat_list }
      else
        format.html { render :new }
        format.json { render json: @group_chat_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_chat_lists/1
  # PATCH/PUT /group_chat_lists/1.json
  def update
    respond_to do |format|
      if @group_chat_list.update(group_chat_list_params)
        format.html { redirect_to @group_chat_list, notice: 'Group chat list was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_chat_list }
      else
        format.html { render :edit }
        format.json { render json: @group_chat_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_chat_lists/1
  # DELETE /group_chat_lists/1.json
  def destroy
    @group_chat_list.destroy
    respond_to do |format|
      format.html { redirect_to group_chat_lists_url, notice: 'Group chat list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_chat_list
      @group_chat_list = GroupChatList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_chat_list_params
      params.require(:group_chat_list).permit(:name)
    end
end
