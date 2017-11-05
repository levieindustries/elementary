class HealthChecksController < ApplicationController
  skip_before_action :require_login

  def show
    head :ok
  end
end
