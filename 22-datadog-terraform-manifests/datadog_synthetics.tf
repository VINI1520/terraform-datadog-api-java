resource "datadog_synthetics_test" "beacon" {
  type    = "api"
  subtype = "http"

  request_definition {
    method = "GET"
    url    = "https://www.tecsys.com/"
  }

  assertion {
    type     = "statusCode"
    operator = "is"
    target   = "200"
  }

  locations = ["aws:us-east-1"]
  options_list {
    tick_every          = 900
    min_location_failed = 1
  }

  name    = "Tecsys website Check"
  message = "Oh no! The Tecsys website is no longer avaliable!"
  tags    = ["app:beacon", "env:demo"]

  status = "live"
}
