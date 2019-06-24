class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  # before_filter :require_login
end
