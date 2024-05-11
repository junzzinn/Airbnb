json.extract! message, :id, :user_id, :chat_id, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
