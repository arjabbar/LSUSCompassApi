namespace :purge do
  desc "Purges all the lectures, courses, and professors with their connected information."
  task records: :environment do
    Lecture.destroy_all
    Schedule.destroy_all
    Professor.destroy_all
    Course.destroy_all
  end
end
