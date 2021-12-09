json.extract! request, :id, :request_name, :request_description, :status_id, :approver_id, :requestor_id, :exhibit_id, :attraction_id, :created_at, :updated_at
json.url request_url(request, format: :json)
