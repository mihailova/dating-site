require 'spec_helper'

describe Picture do
  it { should belong_to(:user) }
  it { should have_attached_file(:image) }
  xit { should validate_attachment_presence(:image) }
end
