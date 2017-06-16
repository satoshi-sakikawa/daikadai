class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
 
  def index
    @tweet = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
    redirect_to tweets_path, notice: "ツイートなう！"
    else
    render'new'
    end
  end

  def edit
  end

  def update
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice:"編集なう"
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"削除なう"
  end

  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end

    private
    def tweets_params
     params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end