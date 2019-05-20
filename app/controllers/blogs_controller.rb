class BlogsController < ApplicationController

  def top

  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def index
  	@blogs = Blog.all
  	@blog = Blog.new
  end

  def new
  	@blog = Blog.new
  end

  def create
  	blog = Blog.new(blog_params)
  	if blog.save
	  	redirect_to blog_path(blog), notice: "Book was successfully created."
	else
		render :index
	end
  end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def update
  	blog = Blog.find(params[:id])
  	if blog.update(blog_params)
  		redirect_to blog_path(blog), notice: "Book was successfully updated."
  	else
  		render :index
  	end
  end

  def destroy
  	blog = Blog.find(params[:id])
  	blog.destroy
  	redirect_to blogs_path

  end

  private
  def blog_params
  	params.require(:blog).permit(:title, :body)
  end
end
