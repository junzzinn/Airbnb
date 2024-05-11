class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show edit update destroy ]

  # GET /chats or /chats.json
  def index
    @chats = Chat.all
  end

  # GET /chats/1 or /chats/1.json
  def show
    @chat = Chat.find(params[:id])
    @message = Message.new(chat_id: @chat.id)
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats or /chats.json
  def create
    if params[:chat][:booking_id].present?
      create_chat_with_booking
    else
      create_chat_without_booking
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
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

  # DELETE /chats/1 or /chats/1.json
  def destroy
    @chat.destroy!

    respond_to do |format|
      format.html { redirect_to chats_url, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

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

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:booking_id)
    end

end
