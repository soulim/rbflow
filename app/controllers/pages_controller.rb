class PagesController < ApplicationController
  respond_to :html

  def show
    @page = params[:id]
    render(:layout => false, :file => "public/404.html", :status => :not_found) unless %w(about).include?(@page)
  end
end
