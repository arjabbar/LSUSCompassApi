module Retreivers
  class CompassHome
    attr_reader :home_page
    delegate :page, :current_page, :visited?, to: :@mechanize

    def initialize
      @mechanize = Mechanize.new
      @home_page = @mechanize.get Settings::COMPASS_HOME
    end

  end
end