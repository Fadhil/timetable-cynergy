json.extract! programme_session, :id, :name, :start_date, :end_date, :active, :completed, :created_at, :updated_at
json.url programme_session_url(programme_session, format: :json)