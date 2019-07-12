json.current_page @customers.current_page
json.previous_page @customers.previous_page
json.next_page @customers.next_page
json.total_pages @customers.total_pages
json.total_entries @customers.total_entries

json.customers do
  json.array! @customers do |customer|
    json.id customer.id
    json.name customer.name
    json.surname customer.surname
    json.gender customer.gender
    json.age customer.age
  end
end
