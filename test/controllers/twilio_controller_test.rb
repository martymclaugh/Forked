require 'test_helper'

class TwilioControllerTest < ActionDispatch::IntegrationTest
  test "should get send_text_message" do
    get twilio_send_text_message_url
    assert_response :success
  end

  test "should get create" do
    get twilio_create_url
    assert_response :success
  end

end
