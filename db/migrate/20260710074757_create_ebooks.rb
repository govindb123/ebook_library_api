class CreateEbooks < ActiveRecord::Migration[7.1]
  def change
    create_table :ebooks do |t|
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
