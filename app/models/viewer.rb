class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    @@all << self
  end

  def self.all
    @@all
  end

  def queue_items
    QueueItem.all.select do |queue_obj|
      queue_obj.viewer == self
    end
  end

  def queue_movies
    queue_items.map do |queue_obj|
      queue_obj.movie

    end
  end

  def add_movie_to_queue(movie)
    QueueItem.new(self, movie)
  end

  def rate_movie(movie, rating)
   queue_items.each do |queue_obj|
      if queue_obj.movie == movie
          queue_obj.rating = rating
      else
        Queue.new(self, movie, rating)
      end
    end

  end

end
