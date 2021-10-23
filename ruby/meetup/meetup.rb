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
      [13,14,15,16,17,18,19].include?(date.day)
    when :first
      [1,2,3,4,5,6,7].include?(date.day)
    when :second
      [8,9,10,11,12,13,14].include?(date.day)
    when :third
      [15,16,17,18,19,20,21].include?(date.day)
    when :fourth
      [22,23,24,25,26,27,28].include?(date.day)
    when :last
    end
  end

  def day(weekday, position)
    date = Date.new(@year,@month)
    date += 1 until correct_day?(date, weekday) && correct_position?(date, position)
    return date
  end
end

p Meetup.new(7, 2014).day(:monday, :teenth)