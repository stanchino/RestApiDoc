module RequestAuthentication
  def login_user
    @user ||= FactoryGirl.create :user
    @project = @user.projects.create(FactoryGirl.attributes_for(:project))
    post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
  end

  def create_suite(project = nil)
    project ||= @project
    @user.suites.create(FactoryGirl.attributes_for(:suite).merge({:project => project}))
  end

  def create_suites(project = nil)
    suites = []
    3.times do
      suites << create_suite(project)
    end
    return suites
  end

  def create_page(suite = nil)
    suite ||= @suite
    suite.pages.create(FactoryGirl.attributes_for(:page))
  end

  def create_pages(suite = nil)
    pages = []
    3.times do
      pages << create_page(suite)
    end
    return pages
  end
end
