class AddUpvoteCounterToWebsite < ActiveRecord::Migration[6.0]
  def up
    add_column :websites, :upvotes_count, :bigint, default: 0

    Website.all.each do |website|
      website.update(upvotes_count: website.upvotes_count)
    end
  end

  def down
    remove_column :websites, :upvotes_count
  end
end
