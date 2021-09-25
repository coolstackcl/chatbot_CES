require "test_helper"

class WebhooksControllerTest < ActionDispatch::IntegrationTest
  test "should get comunicacion" do
    get webhooks_comunicacion_url
    assert_response :success
  end
end
