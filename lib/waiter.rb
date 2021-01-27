class Waiter
attr_accessor :name, :experience

@@all =[]

def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
end

def new_meal(customer, tip, total)
        Meal.new(self, customer, total, tip)
end
def meals
    Meal.all.select do |meal|
        meal.waiter == self
    end
end
def self.all
    @@all
end
def best_tipper
    self.meals.max_by {|meal|meal.tip}.customer
end

end