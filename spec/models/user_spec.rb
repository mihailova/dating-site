require 'spec_helper'

describe User do
	it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:search_for) }

	
end
