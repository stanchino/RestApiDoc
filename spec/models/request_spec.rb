require 'spec_helper'

describe Request do
  context "relations" do
    it { should belong_to(:page) }
    it { should belong_to(:entity) }
  end
end
