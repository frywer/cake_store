class CreateEmailForms < ActiveRecord::Migration
  def change
    create_table :email_forms do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
  end
end
