class SubscribeCustomerJob < ApplicationJob
  queue_as :default

  def perform(customer)
    body = {
      "members": [
        {
          "email_address": customer,
          "status": "subscribed"
        }
      ],
      "update_existing": true
    }

    puts "NEW SUBSCRIBER! #{customer.name}"

    # response = Faraday.post("#{base_url}/lists/#{list_id}", body.to_json, headers)
    # JSON.parse(response.body)
  end

  private

  def headers
    @headers ||= {
      'Authorization' => ENV.fetch('MAILCHIMP_API_KEY')
    }
  end

  def base_url
    @base_url ||= 'https://us3.api.mailchimp.com/3.0'
  end

  def list_id
    @list_id ||= ENV.fetch('LIST_ID')
  end

  def response
    {
      "Customer ID": 100002528,
      "Name": "Steven",
      "Surname": "Cameron",
      "Gender": "Male",
      "Age": 34,
      "Status": "Success"
    }
  end

  def invalid_response
    {
      "new_members": [],
      "updated_members": [],
      "errors": [
        {
          "email_address": "someone",
          "error": "Please provide a valid email address."
        }
      ],
      "total_created": 0,
      "total_updated": 0,
      "error_count": 1
    }
  end
end
