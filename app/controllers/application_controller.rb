class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from PG::ForeignKeyViolation, :with => :has_associated_records

  private

  def has_associated_records
    redirect_to :back
    flash[:error] = I18n.t('.has_associated_records')
  end
end
