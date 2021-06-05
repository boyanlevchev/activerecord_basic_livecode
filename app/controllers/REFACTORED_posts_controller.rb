require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    Post.all.each do |post|
      @view.display_to_user("Title: #{post.title} - #{post.url} - Votes: #{post.votes}")
    end
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post

    post = Post.new(title: request_details("title"), url: request_details("url"))
    post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post

    post = request_updates("update")
    post.update(title: request_details("title"), url: request_details("url"))
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post

    post = request_updates("destroy")
    post.destroy
    @view.display_to_user("Successfully destroyed!")
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post

    post = request_updates("upvote")
    post.update(votes: post.votes += 1)
  end

  def request_details(detail_type)
    @view.display_to_user("#{detail_type}?")
    @view.get_user_input
  end

  def request_updates(update_type)
    @view.display_to_user("What would you like to #{update_type}?")
    index
    name_of_post = @view.get_user_input
    Post.find_by(title: name_of_post)
  end
end


