class Lifter

 @@all = []

  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end


# Get a list of all the memberships that a specific lifter has
def memberships
  membership_arr = Membership.all.select do |membership_ob|
    #binding.pry
      membership_ob.lifter == self
  end
  membership_arr.map do |membership_ob|
    membership_ob
  end
end # end of memberships instance variable


# Get a list of all the gyms that a specific lifter has memberships to
def gyms
  gyms_arr = Membership.all.select do |membership_ob|
    #binding.pry
      membership_ob.lifter == self
  end
  gyms_arr.map do |membership_ob|
    membership_ob.gym
  end
end # end of gyms instance method


# Get the average lift total of all lifters
def self.average_lift
  total_lift = 0
  total_lifters = @@all.length

  lifter_arr = Lifter.all.each do |lifter_ob|
    #binding.pry
    total_lift += lifter_ob.lift_total
  end
  (total_lift.to_f / total_lifters)
end # end of .average_lift Class Method


# Get the total cost of a specific lifter's gym memberships
def total_cost
  cost = 0

  memberships.each do |membership_ob|
    #binding.pry
      cost += membership_ob.cost.to_f
  end
  cost
end # end of total_cost instance method


# Given a gym and a membership cost, sign a specific lifter up for a new gym
def sign_up(cost, gym)
  Membership.new(cost, self, gym)
end # end of sign_up instance method

end # end of Lifter Class
