require 'pry'

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name, species="human")
    @name = name
    @species = species
    Owner.all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.select { |c| c.owner == self }
  end

  def dogs
    Dog.all.select { |d| d.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each { |d| d.mood = "happy" }
  end

  def feed_cats
    Cat.all.each { |c| c.mood = "happy" }
  end

  def sell_pets
    pets = cats + dogs
    pets.each { |p| p.mood = "nervous"}
    pets.each { |p| p.owner = nil }
  end

  def list_pets
    num_cats = cats.count
    num_dogs = dogs.count
    "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

end