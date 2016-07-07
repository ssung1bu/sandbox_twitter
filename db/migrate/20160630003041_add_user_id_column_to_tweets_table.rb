class AddUserIdColumnToTweetsTable < ActiveRecord::Migration
  def change
  	# add_column(:tweets, :user_id, :integer)
  	add_foreign_key(:tweets, :user)
  end
end
