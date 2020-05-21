require 'rubygems'
require 'mechanize'

LOGIN_URL = 'https://brighture.jp/japan/login.html'
TEACHER_PAGE = 'https://brighture.jp/japan/teacher_detail.html?teacher_id=3'
ID = ''
PWD = ''

a = Mechanize.new do |agent|
    agent.user_agent_alias = 'Mac Safari'
    agent.follow_meta_refresh = true
    agent.redirect_ok = true
end

a.get(LOGIN_URL) do |page|
  # Click the login link
  login_page = a.click(page.link_with(:text => /ログイン/))

  # Submit the login form
  login_form = login_page.forms.first
  login_form.uid = ID
  login_form.pwd = PWD
  my_page = login_form.click_button

  my_page.links.each do |link|
    text = link.text.strip
    next unless text.length > 0
    puts text
  end
end


