require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #show' do
        it 'returns http success' do
            user = User.create!(username: 'alpha', password: '123456')
            get :show, params: { id: user.id }
            expect(response).to render_template(:show)
            expect(response).to have_http_status(:success)
        end

        context 'if user does not exist' do
            it 'is not a success' do
                begin
                    get :show, params: { id: -1 }
                rescue StandardError
                    ActiveRecord::RecordNotFound
                end
                expect(response).to_not render_template(:show)
            end
        end
    end

    describe 'GET #new' do
        it 'returns http success' do
            get :new
            expect(response).to render_template(:new)
            expect(response).to have_http_status(:success)
        end
    end

    describe 'GET #create' do
        let(:user_params) do
            {
                user: {
                    username: 'alpha',
                    password: 'password'
                }
            }
        end
        context 'with invalid params' do
            it 'renders the new template' do
                post :create, params: {
                    user: {
                        username: 'alpha',
                        password: ''
                    }
                }
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end
        context 'with valid params' do
            it 'should log in the user' do
                post :create, params: user_params
                user = User.find_by(username: 'alpha')
                expect(session[:session_token]).to eq(user.session_token)
            end

            it 'redirects to the users show page' do
                post :create, params: user_params
                user = User.find_by(username: 'alpha')
                expect(response).to redirect_to(user_url(user))
            end
        end
    end

    describe 'GET #index' do
        it 'returns http success' do
            get :index
            expect(response).to have_http_status(:success)
            expect(response).to render_template(:index)
        end
    end

    # describe "GET #edit" do
    #   it "returns http success" do
    #     get :edit
    #     expect(response).to render_template(:edit)
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    # describe "GET #update" do
    #   it "returns http success" do
    #     get :update
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    # describe "GET #destroy" do
    #   it "returns http success" do
    #     get :destroy
    #     expect(response).to have_http_status(:success)
    #   end
    # end
end
