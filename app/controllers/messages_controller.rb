class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:create]

  def index
    @messages = Message.all
    @message = Message.new
  end

  def show
    @conversation = Chat.find(params[:id]) 
    @messages = @conversation.messages
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @chat = Chat.find_by(id: params[:message][:chat_id])
    unless @chat
      flash[:alert] = "Chat not found"
      redirect_to root_path
      return
    end

    @message = @chat.messages.build(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_path(@chat), notice: "Message was successfully sent." }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_conversation
    @conversation = Chat.find_by(id: params[:message][:chat_id])
    unless @conversation
      flash[:alert] = "Chat not found"
      redirect_to root_path
    end
  end

  def message_params
    params.require(:message).permit(:content, :sender_id, :chat_id)
  end
end
