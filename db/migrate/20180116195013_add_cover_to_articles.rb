class AddCoverToArticles < ActiveRecord::Migration[5.0]
  def up
    add_attachment :arcles, :cover
  end

  def down
    remove_attachment :articles, :cover
  end
end
