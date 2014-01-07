class TestController < ActionController::Base
  Rails.application
  include ActionView::Helpers::UrlHelper

  def render(*attributes); end
end

class PostsController < TestController
  def index
  end
  def create
  end
end