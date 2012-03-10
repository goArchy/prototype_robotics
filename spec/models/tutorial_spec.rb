require 'spec_helper'

describe Tutorial do
  it { should have_many(:steps) }
  it { should have_many(:galleries) }
end
