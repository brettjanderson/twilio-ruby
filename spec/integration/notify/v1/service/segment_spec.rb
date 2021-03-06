##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Segment' do
  it "can read" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .segments.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments?PageSize=50&Page=0",
              "key": "segments",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments?PageSize=50&Page=0"
          },
          "segments": []
      }
      ]
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .segments.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "segments": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2017-02-14T14:36:41Z",
                  "date_updated": "2017-02-14T14:36:41Z",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "GSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "unique_name": "segment"
              }
          ],
          "meta": {
              "first_page_url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments?PageSize=50&Page=0",
              "key": "segments",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Segments?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .segments.list()

    expect(actual).to_not eq(nil)
  end
end