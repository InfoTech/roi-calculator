class DateLib
  class << self
    def date_range(year:, month:)
      next_year = year
      next_month = month + 1
      if next_month == 13
        next_month = 1
        next_year += 1
      end

      [
        Date.iso8601(sprintf '%d-%02d-01', year, month),
        Date.iso8601(sprintf '%d-%02d-01', next_year, next_month)
      ]
    end
  end
end
