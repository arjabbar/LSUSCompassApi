namespace :update do
  desc "Retreives all the lectures that are available on Compass and updates the API's database."
  task lectures: :environment do
    LectureLoader.new.load!
  end

  desc "TODO: This will update the professors with the information retreived from their profile page on LSUS's website."
  task professors: :environment do
  end

  desc "Updates the lectures already in the database with the information retreived from it's details page."
  task lecture_details: :environment do
    LectureDetailsLoader.new.load!
  end

  desc "TODO: This will update the professors ratings from RateMyProfessor.com"
  task professor_ratings: :environment do
  end

end
