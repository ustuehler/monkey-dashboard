json.array!(@accounting_entries) do |accounting_entry|
  json.extract! accounting_entry, :id
  json.url accounting_entry_url(accounting_entry, format: :json)
end
