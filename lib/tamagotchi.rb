class Tamagotchi
  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birthday = Time.new()
    @age = 0
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
    @age = Time.new() - @birthday
  end

  define_method(:time_passes) do
    @age = Time.new() - @birthday
    while @age > 0
      @food_level = @food_level - 1
      @age = @age - 10000
    end
  end

  define_method(:feed) do |food|
    @food_level += food
  end


end
