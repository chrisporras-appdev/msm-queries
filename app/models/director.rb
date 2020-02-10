# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :date
#  bio        :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ApplicationRecord
  def Director.youngest
    return Director.all.order({:dob => :desc}).at(0)
  end
  
  def Director.eldest
    no_nills = Director.all.where.not({:dob => nil})
    return no_nills.order({:dob => :asc}).at(0)
  end

  def filmography
    return Movie.where({ :director_id => self.id})
  end

end
