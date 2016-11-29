class Tamagotchi
  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birthday = Time.now.to_i()
    @age = 0
    @last_ate = Time.now.to_i()
    @last_slept = Time.now.to_i()
    @last_played = Time.now.to_i()
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:set_last_ate) do |time|
    @last_ate = time
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
    @age = Time.now.to_i() + 0.01 - @birthday
  end

  define_method(:time_passes) do
    @age = Time.now.to_i() + 0.01 - @birthday
    while @age > 0
      @food_level -= 1
      @sleep_level -= 1
      @activity_level -= 1
      @age -= 10
    end

  end

  define_method(:feed) do |food|
    if @last_ate - Time.now.to_i() > 20
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
    if amount <= 3
      @sleep_level += amount
    elsif
      @sleep_level += 3
      "I'm wide awake!"
    end
  end

  define_method(:play) do |amount|
    if amount <= 3
      @activity_level += amount
    elsif
      @activity_level += 3
      "That was fun!"
    end
  end



end
