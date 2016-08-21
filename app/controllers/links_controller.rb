class LinksController < ApplicationController
  def index
    @links = Link.all.order(created_at: :desc).limit(100)
  end
end
