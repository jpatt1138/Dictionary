require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word path', {:type => :feature}) do
  it('inserts a word and displays a definition on page') do
    visit('/')
    click_link('Enter a new word')
    expect(page).to have_content("Word Part of speach: Definition: Add Word")
  end
end

describe('the word enter path', {:type => :feature}) do
  it('takes the definition of a word and returns to the index') do
    visit('/')
    click_link('Enter a new word')
    fill_in('word', :with => "ball")
    fill_in('part_of_speach', :with => "n.")
    fill_in('definition', :with => "a round thing to play with")
    click_button('Add Word')
    expect(page).to have_content("Dictionary! Enter a new word Words already added: ball")
  end
end

describe('the definition path', {:type => :feature}) do
  it('follows the word link and navigates to a page listing off the definition') do
    visit('/')
    click_link('Enter a new word')
    fill_in('word', :with => "notball")
    fill_in('part_of_speach', :with => "n.")
    fill_in('definition', :with => "a round thing to play with")
    click_button('Add Word')
    click_link('ball')
    expect(page).to have_content('ball n. a round thing to play with Would you like to add a definition? Part of speach: Definition: Add Word')
  end
end
