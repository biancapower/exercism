=begin
Write your code for the 'Meetup' exercise in this file. Make the tests in
`meetup_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/meetup` directory.
=end
require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def correct_day?(date, weekday)
    case weekday
    when :monday
      date.monday?
    when :tuesday
      date.tuesday?
    when :wednesday
      date.wednesday?
    when :thursday
      date.thursday?
    when :friday
      date.friday?
    when :saturday
      date.saturday?
    when :sunday
      date.sunday?
    end
  end

  def correct_position?(date, pos)
    case pos
    when :teenth
      rng = [*13..19]
    when :first
      rng = [*1..7]
    when :second
      rng = [*8..14]
    when :third
      rng = [*15..21]
    when :fourth
      rng = [*22..28]
    when :last
      case date.month
      when 2
        if date.gregorian.leap?
          rng = [*23..29]
        else
          rng = [*22..28]
        end
      when 9,4,6,11
        rng = [*24..30]
      else
        rng = [*25..31]
      end
    end
    rng.include?(date.day)
  end

  def day(weekday, position)
    date = Date.new(@year,@month)
    date += 1 until correct_day?(date, weekday) && correct_position?(date, position)
    return date
  end
end