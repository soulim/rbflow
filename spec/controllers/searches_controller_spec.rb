require 'spec_helper'

describe SearchesController do
  let(:result) { Kaminari.paginate_array([]) }

  describe "GET index" do
    it "performs search for some items" do
      Search.any_instance.should_receive(:perform).and_return(result)
      get :index
    end
  end
end
