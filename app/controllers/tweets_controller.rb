class TweetsController < ApplicationController
	before_action :authenticate_user!
	
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
		@tweet = Tweet.create(tweet_params.merge(user: current_user))
		redirect_to_tweet_and_set_flash('Created your new tweet')
	end

	def edit
		find_tweet
	end

	def update
		find_tweet
		@tweet.update(tweet_params)
		redirect_to_tweet_and_set_flash("Successfully updated tweet #{@tweet.id}")
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

	def redirect_to_tweet_and_set_flash(message)
		redirect_to(@tweet)
		set_flash(message)
	end

	def tweet_params
		params[:tweet].permit(:text)
	end

	def set_flash(message)
		flash[:info] = message
	end
end