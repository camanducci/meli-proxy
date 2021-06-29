Rails.application.routes.draw do
  get "/", to: "meli_proxy#meli_redirect"
  get "/api/request_details_by_date/:from/:to", to: "request_details#index"
  get "/api/request_details_by_ip/:request_ip", to: "request_details#index_by_ip"

  match "*path", to: "meli_proxy#meli_redirect", via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
