class CreateRequestDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :request_details, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :ip_address
      t.string :path
      t.boolean :valid_request
      t.string :redirected_url
      t.string :throttle_type
      t.timestamps
    end
  end
end
