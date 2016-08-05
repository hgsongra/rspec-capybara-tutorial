class AddPublishDateToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :publish_at, :date
  end
end
