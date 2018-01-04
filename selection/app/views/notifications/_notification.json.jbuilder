json.extract! notification, :id, :headline, :content, :created_at, :updated_at
json.url notification_url(notification, format: :json)
