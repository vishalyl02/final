# app/controllers/api/blogs_controller.rb
module Api
  class BlogsController < ApplicationController
    def index
      @blogs = Blog.all
      render json: @blogs
    end
  end
end
