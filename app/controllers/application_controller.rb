class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    def logged_in_fp_user
      unless fp_user?
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end
end
