class SearchResultPage
  attr_accessor :page

  def initialize(page: page)
    @page = page
  end

  def search_results
    scraper.scrape :search_results
  end

  def scraper
    @scraper ||= Scrapers::SearchResultPage.new(page: page)
  end

  def next_page
    binding.pry
  end

  def next_page?
    binding.pry
  end
end
