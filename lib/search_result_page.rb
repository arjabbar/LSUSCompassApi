class SearchResultPage
  attr_accessor :page

  def initialize(page: page)
    @page = page
  end

  def search_result
    all_search_results.first
  end

  def scraper
    @scraper ||= Scrapers::SearchResultPage.new(page: page)
  end

  def next_page
    result_page = page_form.click_button next_page_button
    SearchResultPage.new page: result_page
  end

  def next_page?
    next_page_button.present?
  end

  private

  def all_search_results
    @all_search_results ||= scraper.scrape(:search_results)
  end

  def page_form
    page.form
  end

  def next_page_button
    page_form.button_with value: 'Next Page'
  end
end
