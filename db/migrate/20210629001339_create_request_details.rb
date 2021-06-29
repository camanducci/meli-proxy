class CreateRequestDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :request_details, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :ip_address
      t.string :path
      t.string :redirected_url
      t.timestamps
    end
  end
end
