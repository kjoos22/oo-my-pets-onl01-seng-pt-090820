class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a human."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all = []
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(cat)
    Cat.new(cat, self)
  end
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end
  
  def walk_dogs
    #dogs = Dog.all.select {|dog| dog.owner == self}
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    cats = Cat.all.select {|cat| cat.owner == self}
    cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    pets = Cat.all.select {|cat| cat.owner == self} +
           Dog.all.select {|dog| dog.owner == self}
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end
  
  def lits_pets
    cats = Cat.all.select {|cat| cat.owner == self}
    dogs = Dog.all.select {|dog| dog.owner == self}
    "I have "
  end
  
end