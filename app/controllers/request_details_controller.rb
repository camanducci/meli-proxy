class RequestDetailsController < ApplicationController
  def index
    #Usar o formato YYYY-MM-DD para buscar os dados das requests por data
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

  def index_by_ip
    requests = RequestDetail.where(ip_address: params[:request_ip])
    render json: requests
  end

end
