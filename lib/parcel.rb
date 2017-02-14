require('pry')

class Parcel
  define_method(:initialize) do |flat_rate, width, height, length, weight, distance, speed, wrapping|
    @width = width.to_f()
    @height = height.to_f()
    @length = length.to_f()
    @weight = weight.to_f()
    @distance = distance.to_f()
    @speed = speed
    @wrapping = wrapping
    @flat_rate = flat_rate
    @time = Time.new()
  end

  define_method(:volume) do
    volume = @length.*(@width).*(@height)
    volume.round(2)
  end

  define_method(:surface) do
    surface = ((@length.*(@height)).*(2)).+((@length.*(@width)).*(2)).+((@height.*(@width)).*(2))
    surface.round(2)
    end

  define_method(:holiday?) do
    if (@time.month() == 11) && (@time.day() >= 24)
      true
    elsif (@time.month() == 12)
      true
    else
      false
    end
  end

  define_method(:cost_to_ship) do
    price = 10.00
    if @flat_rate == "small"
      price = 6.80
      @length = 8.625
      @width = 5.375
      @height = 1.625
    elsif @flat_rate == "medium"
      price = 13.45
      @length = 13.625
      @width = 11.875
      @height = 3.375
    elsif @flat_rate == "large"
      price = 18.75
      @length = 23.6875
      @width = 11.75
      @height = 3
    else
      if self.volume() > 144
        price = price.+(((self.volume()).-(144)).*(0.10))
      end
      if @weight > 2
        price = price.+(@weight-2)
      end
      if @distance > 500
        price = price.+((@distance.-(500)).*(0.01))
      end
    end
      if @speed == "2-day"
        price = price.+(5)
      elsif @speed == "overnight"
        price = price.+(20)
      end
      if @wrapping == "yes"
        price = price.+(((self.surface())./(1296)).*(5))
      end
      if self.holiday?()
        price = price.+(5)
      end
    '%.2f' % price.round(2)
  end
end
