class CreateBadWords < ActiveRecord::Migration
  def change
    create_table :bad_words do |t|
      t.string :bad_word
      t.string :replacement
      t.timestamps
    end
  end
end
