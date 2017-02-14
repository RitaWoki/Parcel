require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('return the shipping price',{:type => :feature}) do
  it ("returns a price of $42.46 for a package that has a volume of 258.64, and a weight of 2lbs, and a distance of 600 miles, and overnight delivery") do
    visit('/')
    select('none', :from => 'flat_rate')
    fill_in('width', :with => "4.5")
    fill_in('height', :with => "4.75")
    fill_in('length', :with => "12.1")
    fill_in('weight', :with => "2")
    fill_in('distance', :with => "600")
    select('overnight', :from => 'speed')
    select('no', :from => 'wrapping')
    click_button('Submit')
    expect(page).to have_content('42.46')
  end
end
