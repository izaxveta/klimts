require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('bill_compton@mail.com').for(:email) }
    it { should_not allow_value('bill_compton').for(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password_digest) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:last_name) }
    it { should have_db_column(:address) }
    it { should define_enum_for(:role).with(['default', 'admin']) }
  end
end