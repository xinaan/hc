class Course < ActiveRecord::Base
  belongs_to :faculty
  has_many :pros , :dependent => :destroy
  has_many :criterions, :dependent => :destroy

  accepts_nested_attributes_for :pros, :reject_if => lambda { |a| a[:description].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :criterions, :reject_if => lambda { |a| a[:description].blank?}, :allow_destroy => true
  validates_presence_of :name, :code, :faculty, :semester
  validates_uniqueness_of :name, :code
  validates_numericality_of :seats, :fee, :semester

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
