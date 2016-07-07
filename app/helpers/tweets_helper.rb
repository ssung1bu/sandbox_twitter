module TweetsHelper
	def edit_tweet_link(t)
		link_to('Edit This Tweet', edit_tweet_url(t))
	end
end
