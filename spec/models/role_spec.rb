require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { FactoryBot.create(:role) }

  it "requires a name and user_id" do
    role = Role.new
    expect(role.valid?).to eq(false)
    expect(role.errors.full_messages).to match_array([
      "Name can't be blank",
      "User must exist"
    ])
  end

  it "can be instantiated with just a name and a user" do
    expect(role.valid?).to eq(true)
  end

  it "can a started_at ended_at" do
    role = FactoryBot.create(:role, :with_started_at, :with_ended_at)
    expect(role.valid?).to eq(true)
  end
end
