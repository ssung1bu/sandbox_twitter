class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all
	end

	def show
		find_tweet
	end

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.create(tweet_params)
		redirect_to_tweet

		set_flash("Great job, you made a tweet!")
	end

	def edit
		find_tweet
	end

	def update
		find_tweet

		@tweet.update(tweet_params)		

		redirect_to_tweet

		set_flash("Tweet #{@tweet.id} was updated successfully!")
	end

	def destroy
		find_tweet

		@tweet.destroy

		redirect_to(tweets_url)
		
		set_flash('The tweet was deleted')
	end

	private

	def find_tweet
		@tweet = Tweet.find(params[:id])
	end

	def redirect_to_tweet
		redirect_to(@tweet)
	end

	def tweet_params
		params[:tweet].permit(:text)
	end

	def set_flash(text)
		flash[:info] = text
	end
end
