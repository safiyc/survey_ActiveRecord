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

describe 'the survey update path', {:type => :feature} do
  it 'allows a user to change the name of the survey' do
    survey1 = Survey.create({:name => 'Color'})
    visit '/'
    click_link('COLOR')
    click_link('Edit Name')
    fill_in('name', :with => 'hello')
    click_button('Update Survey')
    expect(page).to have_content('HELLO')
  end
end

describe 'the question creation path', {:type => :feature} do
  it 'takes the user to the survey page after a question is created' do
    survey1 = Survey.create({:name => 'color'})
    visit '/'
    click_link('COLOR')
    click_link('Edit Name')
    fill_in('name', :with => 'hello')
    click_button('Update Survey')
    fill_in('name', :with => 'Which color describes you best?')
    click_button('Create Question')
    expect(page).to have_content('Which color describes you best?')
  end
end
