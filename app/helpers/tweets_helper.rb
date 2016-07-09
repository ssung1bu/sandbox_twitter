module TweetsHelper
	def edit_tweet_link(tweet)
		link_to('Edit This Tweet', edit_tweet_url(tweet))
	end
end
