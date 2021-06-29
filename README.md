# MELI PROXY

A proxy to redirect requests to api.mercadolibre.com\
It will append any paths and query params to it\
!Flow of request and redirection](https://user-images.githubusercontent.com/41161270/123805205-418ecf80-d8c4-11eb-917e-32f4f43b0561.jpeg
)

It also provides a throttle mechanism to controll the number of requests made by an IP\
and for a Path. It can me tuned on the functions `throttle` found in `/config/initializers/rack_attack.rb`, 
change the params limit(int) and period(seconds).

If you need more info, check it out: [rack attack gem](https://github.com/rack/rack-attack)

It saves all the requests made to the proxy on a Postgres database, with the fields:
  - ip_address: string
  - path : string
  - redirected_url: string
  - created_at: DateTime

It also provides an API to retrive data about the requests filtering by date range,\
using the format YYYY-MM-DD, and by IP. Check The routes below

## Installation

[Installing PostgreSQL](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04-pt)

Clone the project\
`rails db:create`\
`rails db:migrate`\
`rails server`

## Api Routes
  Examples using localhost:3000
  ### Search by data range:
  GET - `localhost:3000/api/request_details_by_date/:from/:to`\
  GET - `localhost:3000/api/request_details_by_date/2021-01-01/2021-05-20`

  ### Search by IP:
  GET - `localhost:3000/api/request_details_by_ip/:request_ip`\
  GET - `localhost:3000/api/request_details_by_ip/128.100.1.10`

  ### Example of response: 
    {
      "size": 26,
      "data": [
        {
          "id": "122ea26a-a879-4f7c-8926-73304d2e1117",
          "ip_address": "::1",
          "path": "/",
          "redirected_url": "https://api.mercadolibre.com/",
          "created_at": "2021-06-29T01:25:13.833Z",
          "updated_at": "2021-06-29T01:25:13.833Z"
    },...
