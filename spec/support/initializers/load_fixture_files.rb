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

  LECTURE_DETAILS_ROW_HTML = Nokogiri::HTML <<-HTML
  <tr class="fccsc-lineStyle-bg-1" id="021668">
  <td class="fccsc-detail-x-small-black" align="LEFT" valign="top">
  <input type="button" value="Add to Cart" onclick="location.href='/FCCSC/servlet/registration.PublicShoppingCarts?function=A&amp;refNum=021668&amp;term=20143'">
  </td>
  <td class="fccsc-detail-x-small-black" align="LEFT" valign="top">021668
  &nbsp;<a href="/FCCSC/servlet/registration.IAS058N0s?RefNum=021668&amp;itemNumber=0"><img src="/FCCSC/images/search.gif" alt="Course Detail" border="0"></a>
  </td>
  <td class="fccsc-detail-x-small-black" align="LEFT">ACCT 205</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">L S U S</td>
  <td class="fccsc-detail-x-small-black" align="CENTER">BE/000206</td>
  <td class="fccsc-detail-x-small-black" align="CENTER">1A</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">06/02/14</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">06/30/14</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">1:00 PM</td>
  <td class="fccsc-detail-x-small-black" align="left">-</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">3:20 PM&nbsp;</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">&nbsp;</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">M&nbsp;</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">T&nbsp;</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">W&nbsp;</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">R&nbsp;</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">&nbsp;</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">&nbsp;</td>
  <td class="fccsc-detail-x-small-black" align="CENTER">19</td>
  <td class="fccsc-detail-x-small-black" align="LEFT">Smolinski, H</td>
  </tr>
  HTML

  INFO_BOX_HTML = Nokogiri::HTML <<-HTML
  <tr class="fccsc-lineStyle-bg-2" id="021691">
    <td colspan="20">
      <table class="infobox">
        <tbody><tr class="fccsc-lineStyle-bg-2">
          <td colspan="20" align="left" class="fccsc-detail-x-small-black">
   50% online
      </td>
    </tr>
    </tbody></table>
    </td>
    </tr>
    HTML

  LECTURE_DETAILS_ROW = LECTURE_DETAILS_ROW_HTML.search('tr').first
  INFO_BOX_ROW = LECTURE_DETAILS_ROW_HTML.search('tr').first
end
