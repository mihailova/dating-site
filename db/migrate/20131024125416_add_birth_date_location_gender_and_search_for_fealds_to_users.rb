class AddBirthDateLocationGenderAndSearchForFealdsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birth_date, :date
    add_column :users, :location, :string
    add_column :users, :gender, :string
    add_column :users, :search_for, :string
  end
end
