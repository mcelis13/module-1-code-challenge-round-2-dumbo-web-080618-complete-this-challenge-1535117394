require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
maddieViewer = Viewer.new('maddie')
harryPotter = Movie.new('HarryPotter')
jeffViewer = Viewer.new('jeffrey')
orderOfPheonix = Movie.new('orderOfPheonix')

myQueue = QueueItem.new(maddieViewer, harryPotter, 5)
myQueue = QueueItem.new(jeffViewer, harryPotter, 3)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
