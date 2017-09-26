require 'capybara/rspec'
require './app'
require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the survey creation path', {:type => :feature} do
  it 'takes the user to the homepage after a survey is created' do
    visit '/'
    fill_in('name', :with => 'Favorite Season')
    click_button('Create Survey')
    expect(page).to have_content('FAVORITE SEASON')
  end
end
