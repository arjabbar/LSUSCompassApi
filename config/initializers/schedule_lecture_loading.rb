require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# scheduler.cron '5 0 * * *' do
#   # do something every day, five minutes after midnight
#   # (see "man 5 crontab" in your terminal)
#   LectureLoader.new.load!
#   LectureDetailsLoader.new.load!
# end

# Thread.new do
#   LectureLoader.new.load!
#   LectureDetailsLoader.new.load!
# end