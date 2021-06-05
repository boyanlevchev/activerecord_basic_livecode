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

  def request_details
    @view.display_to_user("Title?")
    title = @view.get_user_input
    @view.display_to_user("URL?")
    url = @view.get_user_input
    {title: title, url: url}
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post

    # Refactor
    @view.display_to_user("Title?")
    title = @view.get_user_input
    @view.display_to_user("URL?")
    url = @view.get_user_input
    post = Post.new(title: title, url: url)
    post.save
  end

  def request_updates(update_type)
    @view.display_to_user("What would you like to #{update_type}?")
    index
    name_of_post = @view.get_user_input
    Post.find_by(title: name_of_post)
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post

    # Refactor
    @view.display_to_user("What would you like to update?")
    index
    name_of_post = @view.get_user_input
    post = Post.find_by(title: name_of_post)

    # Refactor
    @view.display_to_user("Title?")
    title = @view.get_user_input
    @view.display_to_user("URL?")
    url = @view.get_user_input

    post.update(title: title, url: url)
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post

    # Refactor
    @view.display_to_user("What would you like to destroy?")
    index
    name_of_post = @view.get_user_input
    post = Post.find_by(title: name_of_post)

    post.destroy
    @view.display_to_user("Successfully destroyed!")

    # BONUS:
    # If we want to introduce a fail safe
    # To prevent our application from breaking
    # When somebody puts in a name that doesn't exist
    # We should wrap our delete method in an if statement
    # That checks to see if post is valid
    # If a post wasn't found in the database, it will be nil
    # Which means it will skip to the else statement
    # if post
    #   post.destroy
    #   @view.display_to_user("Successfully destroyed!")
    # else
    #   @view.display_to_user("Name doesn't exist")
    # end
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post

    # Refactor
    @view.display_to_user("What would you like to upvote?")
    index
    name_of_post = @view.get_user_input
    post = Post.find_by(title: name_of_post)

    post.update(votes: post.votes += 1)

  end
end











