##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Binding' do
  it "can fetch" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .bindings("BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings/BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "address": "a7c658f4111ec4ff5a1a647f9d0edd819025b9f20522d2fae897049f32873e73",
          "binding_type": "apn",
          "credential_sid": null,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "endpoint": "26607274",
          "identity": "24987039",
          "notification_protocol_version": "3",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "tags": [
              "26607274"
          ],
          "links": {
              "user": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/24987039"
          },
          "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings/BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .bindings("BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .bindings("BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings/BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        204,
      nil,
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .bindings("BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .bindings.create(identity: "identity", binding_type: "apn", address: "address")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'Identity' => "identity",
        'BindingType' => "apn",
        'Address' => "address",
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "address": "a7c658f4111ec4ff5a1a647f9d0edd819025b9f20522d2fae897049f32873e73",
          "binding_type": "apn",
          "credential_sid": null,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "endpoint": "26607274",
          "identity": "24987039",
          "notification_protocol_version": "3",
          "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "tags": [
              "26607274"
          ],
          "links": {
              "user": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/24987039"
          },
          "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings/BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .bindings.create(identity: "identity", binding_type: "apn", address: "address")

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                       .bindings.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "bindings": [],
          "meta": {
              "first_page_url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings?PageSize=50&Page=0",
              "key": "bindings",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .bindings.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "bindings": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "address": "a7c658f4111ec4ff5a1a647f9d0edd819025b9f20522d2fae897049f32873e73",
                  "binding_type": "apn",
                  "credential_sid": null,
                  "date_created": "2015-07-30T20:00:00Z",
                  "date_updated": "2015-07-30T20:00:00Z",
                  "endpoint": "26607274",
                  "identity": "24987039",
                  "notification_protocol_version": "3",
                  "service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sid": "BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "tags": [
                      "26607274"
                  ],
                  "links": {
                      "user": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Users/24987039"
                  },
                  "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings/BSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ],
          "meta": {
              "first_page_url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings?PageSize=50&Page=0",
              "key": "bindings",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://notify.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Bindings?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.notify.v1.services("ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                              .bindings.list()

    expect(actual).to_not eq(nil)
  end
end