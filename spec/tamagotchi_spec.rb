require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe('#initialize') do
    it('creates a new instance of class and tests default settings for monster') do
      new_monster = Tamagotchi.new("Zebraxas")
      expect(new_monster.name()).to(eq("Zebraxas"))
      expect(new_monster.food_level).to(eq(10))
      expect(new_monster.sleep_level).to(eq(10))
      expect(new_monster.activity_level).to(eq(10))
    end
  end

  describe('#is_alive') do
    it('check to see if the food level is above 0') do
      new_monster = Tamagotchi.new("Zebraxas")
      expect(new_monster.is_alive()).to(eq(true))
    end

    it('is dead if food level reaches 0') do
      new_monster = Tamagotchi.new("Zebraxas")
      new_monster.eat(10)
      expect(new_monster.is_alive()).to(eq(false))
    end
  end

  describe('#time_passes') do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      new_monster = Tamagotchi.new("Zebraxas")
      new_monster.time_passes()
      expect(new_monster.food_level).to(eq(9))
    end
  end

  describe('#age') do
    it("tests that monster has age") do
      new_monster = Tamagotchi.new("Zebraxas")
      expect(new_monster.age>0).to(eq(true))
    end
  end

  describe('#feed') do
    it('adds food to the tamagotchi food level') do
      new_monster = Tamagotchi.new("Zebraxas")
      expect(new_monster.feed(2)).to(eq(12))
    end
  end

  describe('#sleep') do
    it('adds sleep to the tamagotchi sleep level') do
      new_monster = Tamagotchi.new("Zebraxas")
      expect(new_monster.sleep(2)).to(eq(12))
    end
  end

  describe('#play') do
    it('adds play to the tamagotchi activity level') do
      new_monster = Tamagotchi.new("Zebraxas")
      expect(new_monster.play(2)).to(eq(12))
    end
  end

end
