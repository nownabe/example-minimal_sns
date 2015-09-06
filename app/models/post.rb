class Post < ActiveRecord::Base
  belongs_to :user

  default_scope { order("created_at desc") }
  paginates_per 10
end
