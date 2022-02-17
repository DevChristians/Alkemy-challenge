class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :title
      t.date :creation_date
      t.string :qualification

      t.timestamps
    end
  end
end
