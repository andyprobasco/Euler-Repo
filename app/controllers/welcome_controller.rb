class WelcomeController < ApplicationController
  def index
  	@lastPosts = Post.last(3).reverse
  end
end
