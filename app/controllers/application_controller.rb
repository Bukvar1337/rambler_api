class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Rails::Pagination

  skip_before_action :verify_authenticity_token, raise: false
end
