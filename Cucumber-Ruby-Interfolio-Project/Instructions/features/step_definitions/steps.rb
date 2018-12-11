



When(/^the user navigates to the Interfolio page$/) do
  driver = $driver
  driver.get "https://www.interfolio.com/"
  driver.find_element(:xpath, "//*[@class='get-started sign-in-btn'][contains(text(),'Sign In')]").click
  end


Then(/^the user create a new user account$/) do
  name = Faker::Name.first_name
  email =  Faker::Internet.free_email
  lastName= Faker::Name.last_name
  driver = $driver
  driver.find_element(:xpath, "//*[contains(text(),'Sign Up')]").click
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.find_element(:xpath, "//*[@class='fa fa-fw ng-scope fa-remove']") }
  driver.find_element(:xpath, "//*[@class='fa fa-fw ng-scope fa-remove']").click
  driver.find_element(:id, "email").send_keys(name+email)
  driver.find_element(:id,"first-name").send_keys(name)
  driver.find_element(:id,"last-name").send_keys(lastName)
  driver.find_element(:id,"password").send_keys("Pass7word1")
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until {driver.find_element(id: 'position-status' )}
  positionDropDown = driver.find_element(id: 'position-status')
  select_list = Selenium::WebDriver::Support::Select.new(positionDropDown)
  select_list.select_by(:text, 'Tenured')
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until {driver.find_element(id: 'how-did-you-hear' )}
  hearDropDown = driver.find_element(id: 'how-did-you-hear')
  select_list = Selenium::WebDriver::Support::Select.new(hearDropDown)
  select_list.select_by(:text, 'Social Media')
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until {driver.find_element(:name,"country_of_residence")}
  driver.find_element(:name,"country_of_residence").click
  driver.find_element(:xpath,"//*[contains(text(),'United States')]").click
  sleep 3
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.find_element(:xpath, "//*[@for='agree-to-terms']") }
  driver.find_element(:xpath, "//*[@for='agree-to-terms']").click
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.find_element(:xpath, "//*[@ng-click='$ctrl.submitForm()']") }
  driver.find_element(:xpath, "//*[@ng-click='$ctrl.submitForm()']").click




end

When(/^the account should successfully be created$/) do
  driver = $driver
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  puts "Test Passed: Account successful " if wait.until {
    driver.find_element(:xpath, "//*[contains(text(),'Create Your Profile')]").displayed?
  }
end

When(/^the user clicks the home button$/) do
  driver = $driver
  sleep 3
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.find_element(:xpath, "//*[@class='fis-header-logo']") }
  driver.find_element(:xpath, "//*[@class='fis-header-logo']").click

end

When("the user selects the Materials link in the account page") do
  driver = $driver
  sleep 2
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.find_element(:xpath, "//*[@href='/materials']")}
  driver.find_element(:xpath, "//*[@href='/materials']").click
end

When("the user uploads a document") do
  driver = $driver
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { driver.find_element(:xpath, "//*[@ng-click='openAddMaterialModal()']")}
  driver.find_element(:xpath," //*[@ng-click='openAddMaterialModal()']").click
  wait.until { driver.find_element(:xpath, "//*[@text='Browse To Upload']")}
  driver.find_element(:xpath," //*[@text='Browse To Upload']").click
  driver.find_element(xpath: "//*[@text='Browse To Upload']").send_keys("image/btcimage.jpg")
end


When(/^the document should be successfully uploaded$/) do
  driver = $driver
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  puts "Upload successful" if wait.until {
    driver.find_element(:xpath, "//*[contains(text(),' Thank You! Your files are uploading now')]").displayed?
  }
end



