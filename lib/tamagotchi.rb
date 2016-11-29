class Tamagotchi
  @@all = []
  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birthday = Time.now.to_i() - 1
    @age = 0
    @last_ate = Time.now.to_i()
    @last_slept = Time.now.to_i()
    @last_played = Time.now.to_i()
    @time_passed = 0
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:is_alive) do
    if @food_level > 0
      true
    else
      false
    end
  end

  define_method(:eat) do |quantity|
    @food_level -= quantity
  end

  define_method(:age) do
    @age = Time.now.to_i() -  @birthday
  end

  define_method(:time_passes) do
    self.age()
    while @age - @time_passed >= 0
      @food_level -= 1
      @sleep_level -= 1
      @activity_level -= 1
      @time_passed += 10
    end

  end

  define_method(:feed) do |food|
    if Time.now.to_i() - @last_ate > 20
      if food <= 3
        @last_ate = Time.now().to_i()
        @food_level += food
      elsif
        @food_level += 3
        @last_ate = Time.now().to_i()
        "I can't eat that much food"
      end
    @food_level
    else
      "Not hungry"
    end
  end

  define_method(:sleep) do |amount|
    if Time.now.to_i() - @last_slept > 20
      if amount <= 3
        @last_slept = Time.now().to_i()
        @sleep_level += amount
      elsif
        @last_slept = Time.now().to_i()
        @sleep_level += 3
        "I'm wide awake!"
      end
      @sleep_level
    else
      "Not tired"
    end
  end

  define_method(:play) do |amount|
    if Time.now.to_i() - @last_played > 20
      if amount <= 3
        @last_played = Time.now.to_i()
        @activity_level += amount
      elsif
        @last_played = Time.now.to_i()
        @activity_level += 3
      end
      @activity_level
    else
      "That was fun!"
    end
  end

  define_method(:save) do
    @@all.push(self)
  end

  define_singleton_method(:all) do
    @@all
  end

  define_singleton_method(:clear) do
    @@all = []
  end

#The following methods are used to test functionality in rspec

  define_method(:set_last_ate) do |time|
    @last_ate = time
  end

  define_method(:set_last_played) do |time|
    @last_played = time
  end

  define_method(:set_last_slept) do |time|
    @last_slept = time
  end

end
