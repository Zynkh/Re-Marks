class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.string :author
      t.belongs_to :user
      t.timestamps
    end
  end
end
