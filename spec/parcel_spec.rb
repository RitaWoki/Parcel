require('parcel')
require('rspec')

describe(Parcel) do
  describe('#volume') do
    it('returns the volume of a package') do
      test_package = Parcel.new('none', 2, 3, 4, 1, 10, 'standard', 'no')
      expect(test_package.volume()).to (eq(24))
    end
  end

  describe('#surface') do
    it('returns the surface area of a package') do
      test_package = Parcel.new('none', 2, 2, 2, 1, 10, 'standard', 'yes')
      expect(test_package.surface()).to (eq(24.00))
    end
  end

  describe('#cost_to_ship') do
    it('returns a price of $10 for a package that has a volume less than 144 square inches, a weight less than 2 pounds, a distance less than 500 miles, and standard shipping') do
      test_package = Parcel.new('none', 2, 3, 4, 1, 10, 'standard', 'no')
      expect(test_package.cost_to_ship()).to (eq('10.00'))
    end

    it('returns a price of $14.80 for a package that has a volume of 192 square inches') do
      test_package = Parcel.new('none', 4, 4, 12, 1, 10, 'standard', 'no')
      expect(test_package.cost_to_ship()).to (eq('14.80'))
    end

    it('returns a price of $15.80 for a package that has a volume of 192, and a weight of 3lbs') do
      test_package = Parcel.new('none', 4, 4, 12, 3, 10, 'standard', 'no')
      expect(test_package.cost_to_ship()).to (eq('15.80'))
    end

    it('returns a price of $16.30 for a package that has a volume of 192, and a weight of 3.5lbs') do
      test_package = Parcel.new('none', 4, 4, 12, 3.5, 10, 'standard', 'no')
      expect(test_package.cost_to_ship()).to (eq('16.30'))
    end

    it('returns a price of $21.46 for a package that has a volume of 258.64, and a weight of 2lbs') do
      test_package = Parcel.new('none', 4.5, 4.75, 12.1, 2, 10, 'standard', 'no')
      expect(test_package.cost_to_ship()).to (eq('21.46'))
    end

    it('returns a price of $22.46 for a package that has a volume of 258.64, and a weight of 2lbs, and a distance of 600 miles') do
      test_package = Parcel.new('none', 4.5, 4.75, 12.1, 2, 600, 'standard', 'no')
      expect(test_package.cost_to_ship()).to (eq('22.46'))
    end

    it('returns a price of $27.46 for a package that has a volume of 258.64, and a weight of 2lbs, and a distance of 600 miles, and 2-day delivery') do
      test_package = Parcel.new('none', 4.5, 4.75, 12.1, 2, 600, '2-day', 'no')
      expect(test_package.cost_to_ship()).to (eq('27.46'))
    end

    it('returns a price of $42.46 for a package that has a volume of 258.64, and a weight of 2lbs, and a distance of 600 miles, and overnight delivery') do
      test_package = Parcel.new('none', 4.5, 4.75, 12.1, 2, 600, 'overnight', 'no')
      expect(test_package.cost_to_ship()).to (eq('42.46'))
    end

    it('returns a price of $42.46 for a package that has a volume of 258.64, a weight of 2lbs, a distance of 600 miles, overnight delivery, and wrapped') do
      test_package = Parcel.new('none', 4.5, 4.75, 12.1, 2, 600, 'overnight', 'yes')
      expect(test_package.surface()).to (eq(266.60))
      expect(test_package.cost_to_ship()).to (eq('43.49'))
    end

    it('returns a price of $6.80 for a package in a small flat-rate box with standard delivery') do
      test_package = Parcel.new('small', 8.625, 5.375, 1.625, 2, 600, 'standard', 'no')
      expect(test_package.cost_to_ship()).to (eq('6.80'))
    end

    it('returns a price of $33.45 for a package in a medium flat-rate box with overnight delivery') do
      test_package = Parcel.new('medium', 8.625, 5.375, 1.625, 2, 600, 'overnight', 'no')
      expect(test_package.cost_to_ship()).to (eq('33.45'))
    end
  end
end
