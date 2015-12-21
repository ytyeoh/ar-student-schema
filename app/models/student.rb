require_relative '../../db/config'

class Student < ActiveRecord::Base
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
   validates :email, uniqueness: true
   validates :age, :numericality => { :greater_than_or_equal_to => 5 }
   validates :phone, :length => { :minimum => 10 }

  def name
    # # name.gsub(/(\w*)(\s)(\w*)/, \1\3 )
    # first_name= name.gsub(/("\w*)(\s)(\w*)/", '\1\')
    # last_name = name.gsub(/("\w*)(\s)(\w*)/", '\3' )
    # first_name, last_name = name
    name = "#{self.first_name} #{self.last_name}"
  end

  def age

    age = Time.now.year - birthday.year
  end
end

