# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
    scenario 'has a new user page' do
        visit new_user_url
        expect(page).to have_content 'Sign Up'
    end

    feature 'signing up a user' do
        scenario 'shows username on the homepage after signup' do
            visit new_user_url
            fill_in 'username', with: 'testing_username'
            fill_in 'password', with: 'biscuits'
            click_on 'Create User'
            expect(page).to have_content('Welcome testing_username')
        end
    end
end

feature 'logging in' do
    scenario 'shows username on the homepage after login' do
        User.create(username: 'testing_username', password: 'biscuits')
        visit new_session_url
        fill_in 'username', with: 'testing_username'
        fill_in 'password', with: 'biscuits'
        click_on 'Sign in'
        expect(page).to have_content('Welcome testing_username')
    end
end

feature 'logging out' do
    scenario 'begins with a logged out state' do
        visit users_url
        expect(page).to have_content('Sign in')
    end
    scenario 'doesn\'t show username on the homepage after logout' do
        User.create(username: 'testing_username', password: 'biscuits')
        visit new_session_url
        fill_in 'username', with: 'testing_username'
        fill_in 'password', with: 'biscuits'
        click_on 'Sign in'
        expect(page).to have_content('Welcome')
        visit users_url
        click_on 'Sign out'
        expect(page).to_not have_content('Welcome')
    end 
end
