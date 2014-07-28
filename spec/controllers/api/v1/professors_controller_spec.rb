require 'spec_helper'

describe API::V1::ProfessorsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
