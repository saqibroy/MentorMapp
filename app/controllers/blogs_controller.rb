class BlogsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	before_action :find_post, only: [:show]

    def index
		@posts= Post.all.order("created_at desc")
	end
	def new
		@post=current_user.posts.build
	end
	def create
		@post=current_user.posts.build(post_params)
		if @post.save
			redirect_to blog_path, notice: "yea!, you create it."
		else
			render 'new', notice: "No!, You failed us!" 
		end
	end
	def show
		@post.number_of_views= @post.number_of_views + 1
		@post.save
		@posts=Post.all.limit(10)
	end
	private
	def post_params
		params.require(:post).permit(:title,:content, :image, :sub_title)
	end
	def find_post
		@post=Post.find(params[:id])
	end

end
