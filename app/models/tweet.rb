class Tweet < ActiveRecord::Base
	belongs_to :user

	def text_and_author
		"#{text} by #{user.name}"
	end
end
