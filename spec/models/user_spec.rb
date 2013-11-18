require 'spec_helper'

describe User do
	it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:search_for) }
  it {should ensure_inclusion_of(:gender).in_array(User::GENDER) }
  it {should ensure_inclusion_of(:search_for).in_array(User::SEARCH_FOR) }
  it { should have_many(:pictures).dependent(:destroy) }
	
end
