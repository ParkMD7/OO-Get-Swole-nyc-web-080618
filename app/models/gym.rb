class Gym

 @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end


# Get a list of all memberships at a specific gym
def memberships
  member_arr = Membership.all.select do |membership_ob|
    #binding.pry
      membership_ob.gym == self
  end
  member_arr.map do |membership_ob|
    membership_ob
  end
end # end of memberships instance method


# Get a list of all the lifters that have a membership to a specific gym
def lifters
  lifter_arr = Membership.all.select do |membership_ob|
    #binding.pry
    membership_ob.gym == self
  end
  lifter_arr.map do |membership_ob|
    membership_ob.lifter
  end
end # end of lifter_memberships instance method


# Get a list of the names of all lifters that have a membership to that gym
def lifter_names
  lifter_name_arr = Membership.all.select do |membership_ob|
    #binding.pry
    membership_ob.gym == self
  end
  lifter_name_arr.map do |membership_ob|
    membership_ob.lifter.name
  end
end # end of lifter_names instance method


# Get the combined lift_total of every lifter has a membership to that gym
def lift_total_for_gym
  total = 0

  lifters.each do |lifter_ob|
    #binding.pry
    total += lifter_ob.lift_total
  end
  total
end # end of lift_total_for_gym instance method

end # end of Gym Class
