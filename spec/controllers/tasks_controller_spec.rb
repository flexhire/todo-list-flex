require 'rails_helper'

describe TasksController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:tasks) { FactoryBot.create_list(:task, 10) }

  describe 'GET #index' do
    before do
      # sign_in user
    end

    it 'assigns tasks to @tasks instance variable' do
      get :index

      expect(assigns(:tasks)).to match_array tasks
     end
  end
end
