require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'method format_name' do
    it 'returns username if realname not set' do
      user = User.new username:"pekka"

      expect(user.format_name(true)).to eq("pekka")
    end

    it 'returns realname if realname is set and both attribute is false' do
      user = User.new username:"pekka", realname:"pekka koivisto"

      expect(user.format_name(false)).to eq("pekka koivisto")
    end

    it 'returns realname and username if realname is set and both attribute is true' do
      user = User.new username:"pekka", realname:"pekka koivisto"

      expect(user.format_name(true)).to eq("pekka koivisto (pekka)")
    end
  end
end
