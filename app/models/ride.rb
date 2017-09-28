class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    case
    when attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    when attraction.tickets > user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    when attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end
