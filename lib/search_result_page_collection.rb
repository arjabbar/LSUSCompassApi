class SearchResultPageCollection
  include Enumerable
  delegate :each, to: :@pages
  attr_accessor :first_result_page, :pages
  
  def initialize(first_result_page:)
    if first_result_page.is_a? Mechanize::Page
      @first_result_page = SearchResultPage.new(page: first_result_page)
    else
      @first_result_page = first_result_page
    end
    @pages = [@first_result_page]
  end

  def grab_all_search_results
    grab_next_page while next_page?
  end

  def grab_next_page
    pages << pages.last.next_page if next_page?
  end

  def next_page?
    pages.last.next_page?
  end

end