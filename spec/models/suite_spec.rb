require 'spec_helper'

describe Suite do
  context "relations" do
    it { should belong_to(:project) }
  end
end
