json.array!(@email_forms) do |email_form|
  json.extract! email_form, :id, :name, :email, :phone, :subject, :message
  json.url email_form_url(email_form, format: :json)
end
