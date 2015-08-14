require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word and definition execution path', {:type => :feature}) do
  it('adds a new word and definition and is returned to the homepage with the word listed') do
    visit('/')
    click_link('Add New Word and Definition')
    fill_in('word', :with => 'taxi')
    fill_in('definition', :with => 'An expensive life choice')
    click_button('Submit')
    expect(page).to have_content('taxi')
  end

  it('visits a previously saved word and adds a new definition') do
    visit('/')
    click_link('taxi')
    fill_in('definition', :with => 'A smelly ride indeed.')
    click_button('Submit')
    expect(page).to have_content('taxi')
    expect(page).to have_content('An expensive life choice')
    expect(page).to have_content('A smelly ride indeed.')
  end
end
