def sign_up
  visit('/users/new')
  fill_in 'email', with: 'test@example.com'
  fill_in 'pass', with: 'test123'
  click_button 'Submit Details'
end

def sign_in
  visit('/sessions/new')
  fill_in 'email', with: 'test@example.com'
  fill_in 'pass', with: 'test123'
  click_button 'Sign In'
end
