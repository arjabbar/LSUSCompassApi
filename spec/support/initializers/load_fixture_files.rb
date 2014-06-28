class TestFixtures
  FIXTURE_PAGES_PATH = Rails.root.join 'spec', 'fixtures', 'pages'
  class << self
    private :new
    Dir["#{FIXTURE_PAGES_PATH}/*.html"].each do |html_page_path|
      method_name = html_page_path.split(/\/|\./)[-2]
      define_method method_name do
        eval("@#{method_name} ||= Mechanize.new.get 'file:///' + html_page_path")
      end
    end

  end
end
