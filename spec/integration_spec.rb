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

describe 'the survey update path' {:type => :feature} do
  it 'allows a user to change the name of the survey' do
    survey1 = Survey.create({:name => 'Season'})
    visit '/'
    click_link('SEASON')
    click_link('Edit Name')
    fill_in('name', :with => 'Color')
    click_button('Update Survey')
    expect(page).to have_content('COLOR')
  end
end
