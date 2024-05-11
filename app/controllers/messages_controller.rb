class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:create]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
    @message = Message.new
  end

  # GET /messages/1 or /messages/1.json
  def show
    @conversation = Chat.find(params[:message][:chat_id])
    @messages = @conversation.messages
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Chat.find(params[:message][:chat_id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :sender_id, :chat_id)
    end

    def chat_params
      params.require(:chat).permit(:any_other_parameters_you_have)
    end
end
