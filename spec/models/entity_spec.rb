require 'spec_helper'

describe Entity do
  context "relations" do
    it { should have_many(:requests) }
  end
end
