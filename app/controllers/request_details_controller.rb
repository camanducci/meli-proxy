class RequestDetailsController < ApplicationController
  def index
    #Use the format YYYY-MM-DD to fetch request data from database
    #URL: /api/request_details_by_date/:from/:to
    
    response = {}
    from_date = params[:from].split("-")
    to_date = params[:to].split("-")
    request_details = RequestDetail.where('created_at between ? and ?',
      DateTime.new(from_date[0].to_i, from_date[1].to_i, from_date[2].to_i),
      DateTime.new(to_date[0].to_i, to_date[1].to_i, to_date[2].to_i))
    response[:size] = request_details.size
    response[:data] = request_details.as_json
    render json: response
  end

  #Use the IP fetch request data from database
  #URL: /api/request_details_by_ip/:request_ip
  def index_by_ip
    requests = RequestDetail.where(ip_address: params[:request_ip])
    render json: requests
  end

end
