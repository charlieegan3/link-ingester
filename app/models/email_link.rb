class EmailLink < ApplicationRecord
  belongs_to :email
  belongs_to :link

  before_validation :set_link, on: :create

  def set_link
    target = RedirectExplorer.new.explore(self.source_url)
    self.link = Link.find_or_create_by_url(target)
  end
end
