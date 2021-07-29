class CreateEmailWhitelists < ActiveRecord::Migration[6.1]
  def change
    create_table :email_whitelists do |t|
      t.string :email, null: false
      t.timestamps
    end
  end
end
