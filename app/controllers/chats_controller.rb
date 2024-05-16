class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show edit update destroy ]

  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new(chat_id: @chat.id)
  end

  def new
    @chat = Chat.new
  end

  def edit
  end

  def create
    if params[:chat][:booking_id].present?
      create_chat_with_booking
    else
      create_chat_without_booking
    end
  end

  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to chat_url(@chat), notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to chats_url, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def create_chat_with_booking
    @chat = Chat.find_or_initialize_by(booking_id: chat_params[:booking_id])

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

  def create_chat_without_booking
    @chat = Chat.new

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

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:booking_id)
  end
end
