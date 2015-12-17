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
# implement your Student model here

  # def validate
  #   if email =~ /^[A-Z0-9][A-Z0-9._%+-]{0,63}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/ && email != self.email && 5 < (Time.now.year - birthday.year)
  #     return true
  #   else
  #     false
  #   end

end


