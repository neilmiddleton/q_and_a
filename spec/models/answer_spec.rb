require "rails_helper"

describe Answer, type: :model do
  let(:user_id) { SecureRandom.uuid }

  it { should belong_to(:question) }
  it { should validate_presence_of(:text) }
end
