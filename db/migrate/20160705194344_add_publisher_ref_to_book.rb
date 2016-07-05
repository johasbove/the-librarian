class AddPublisherRefToBook < ActiveRecord::Migration
  def change
    add_reference :books, :publisher, index: true

    Rake::Task['db:migrate_editorial'].invoke
  end
end
