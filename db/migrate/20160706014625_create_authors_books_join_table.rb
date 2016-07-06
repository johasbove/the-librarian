class CreateAuthorsBooksJoinTable < ActiveRecord::Migration
  def change
    create_join_table :authors, :books do |t|
      # t.index [:author_id, :book_id]
      t.index [:book_id, :author_id]
    end

    Rake::Task['db:migrate_author'].invoke
  end
end
