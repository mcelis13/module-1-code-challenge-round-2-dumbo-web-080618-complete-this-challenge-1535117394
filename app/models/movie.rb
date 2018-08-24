class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def queue_items
    QueueItem.all.select do |queue_obj|
      queue_obj.movie == self
    end
  end

  def viewers
    queue_items.map do |queue_obj|
      queue_obj.viewer
    end
  end

  def average_rating
    ratings = queue_items.map do |queue_obj|
      queue_obj.rating
    end
    average = ratings.reduce(:+)/ queue_items.length
  end

  def self.highest_rated
    max = 0
    QueueItem.all.each do |queue_obj|
      if max <  queue_obj.rating
        max = queue_obj.rating
      end
    end
    max
  end

end

### `Movie`

# + `Movie.all`
#   + returns an array of all `Movie`
# + `Movie#queue_items`
#   + returns an array of all the `QueueItem` instances that contain this movie
# + `Movie#viewers`
#   + returns an array of all of the `Viewer`s with this `Movie` instance in their queue
# + `Movie#average_rating`
#   + returns the average of all ratings for this instance of `Movie`
# + `Movie.highest_rated`
#   + returns the instance of `Movie` with the highest average rating
