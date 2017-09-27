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

describe 'the survey update path', {:type => :feature} do
  it 'allows a user to delete the name of the survey' do
    survey1 = Survey.create({:name => 'Color'})
    visit '/'
    click_link('COLOR')
    click_link('Edit Name')
    click_button('Delete Survey')
    expect(page).not_to have_content('COLOR')
  end
end

# no error manually clicking through steps, but rspec error:
# Capybara::ElementNotFound:
#        Unable to find visible button "Update Question"

describe 'the question update path', {:type => :feature} do
  it 'allows a user to change a question' do
    survey1 = Survey.create({:name => 'color'})
    visit '/'
    click_link('COLOR')
    fill_in('name', :with => 'Which color describes you best?')
    click_button('Create Question')
    fill_in('name', :with => 'Huh?')
    click_button('Update Question')
    expect(page).to have_content('Huh?')
  end
end

# describe 'the question delete path', {:type => :feature} do
#   it 'allows a user to delete a question' do
#     survey1 = Survey.create({:name => 'color'})
#     visit '/'
#     click_link('COLOR')
#     fill_in('name', :with => 'Which color describes you best?')
#     click_button('Update Question')
#     expect(page).not_to have_content('Which color describes you best?')
#   end
# end
