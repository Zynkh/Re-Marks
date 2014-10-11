class CreateSelectComments < ActiveRecord::Migration
  def change
    create_table :selectioncomments do |t|
      t.text :content
      t.belongs_to :user
      t.belongs_to :document
      t.timestamps
    end
  end
end