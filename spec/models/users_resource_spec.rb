require 'spec_helper'

describe UsersResource do
  context "relations" do
    it { should belong_to(:user) }
  end
end
