json.extract! profile, :id, :salutation, :full_name, :staff_id, :designation, :faculty, :office_telephone_number, :mobile_telephone_number, :employment_type, :qualification, :field_of_knowledge, :technical_skills, :personal_skills, :created_at, :updated_at
json.url profile_url(profile, format: :json)