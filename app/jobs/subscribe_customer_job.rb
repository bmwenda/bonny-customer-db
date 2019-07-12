class SubscribeCustomerJob < ApplicationJob
  queue_as :default

  # TODO
  # Mirror Mailchimp API by mocking API requests and returning dynamic response

  def perform(customer)
    request_body = {
      "members": [
        {
          "email_address": 'example@email.com',
          "status": "subscribed"
        }
      ],
      "update_existing": true
    }

    # WIP: Replace API call with stub to avoid making external requests

    # response = Faraday.post("#{base_url}/lists/#{list_id}", request_body.to_json, headers)
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
    # Sample response
    {
      "Customer ID": 100002528,
      "Name": "Steven",
      "Surname": "Cameron",
      "Gender": "Male",
      "Age": 34,
      "Status": "Success"
    }
  end
end
