require 'spec_helper'

describe Project do
  it { should belong_to(:spree_user) }
  it { should have_many(:galleries) }
  it { should have_many(:steps) }
end
