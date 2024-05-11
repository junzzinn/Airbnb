json.extract! booking, :id, :residence_id, :user_id, :total_price, :start_date, :end_date, :status, :created_at, :updated_at
json.url booking_url(booking, format: :json)
