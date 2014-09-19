module Parsers
  class RateMyProfessorPaging < Base
    def first_page_node
      search('[id*=first]').first
    end

    def first_page_url
      first_page_node[:href]
    end

    def back_a_page_node
      search('[id*=back]').first
    end

    def back_a_page_url
      back_a_page_node[:href]
    end

    def next_page_node
      search('[id*=next]').first
    end

    def next_page_url
      next_page_node[:href]
    end

    def last_page_node
      search('[id*=last]').first
    end

    def last_page_url
      last_page_node[:href]
    end

    def number_of_pages
      raise "An href attribute wasn't found on the last page node #{last_page_node}." unless last_page_url.present?
      last_page_url.split('=').last.to_i
    end
  end
end
