class Faculty < ActiveRecord::Base
  has_many :courses, :dependent => :restrict_with_error

  validates_presence_of :name, :short
  validates_uniqueness_of :name, :short
  scope :active, ->{ where(visible: true) }
  scope :in_active, ->{ where(visible: false) }
  def invisible
    if visible == false
      self.visible = true
    else
      self.visible = false
    end
  end
end
