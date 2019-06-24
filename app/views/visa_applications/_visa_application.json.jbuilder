json.extract! visa_application, :id, :title, :body, :created_at, :updated_at
json.url visa_application_url(visa_application, format: :json)
