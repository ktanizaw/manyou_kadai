class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  class Forbidden < ActionController::ActionControllerError
  end

  rescue_from Forbidden, with: :rescue403

  private
    def rescue403(e)
      @exception = e
      render template: 'errors/forbidden', status: 403
    end
  end
