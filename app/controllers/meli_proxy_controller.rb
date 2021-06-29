class MeliProxyController < ApplicationController
  def meli_redirect
    if request.query_parameters.present?
      query_parameters_string = "?"
      request.query_parameters.each do |key, value|
        query_parameters_string += key + "=" + value + "&"
      end
    end
    redirect_url = "https://api.mercadolibre.com#{request.env['PATH_INFO']}#{query_parameters_string}"
    RequestDetail.create(
      ip_address: request.remote_ip,
      path: request.env['PATH_INFO'],
      valid_request: true,
      redirected_url: redirect_url,
      throttle_type: nil)
    redirect_to redirect_url
  end
end