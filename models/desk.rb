require_relative('record')

class Desk

  def initialize(desk_number)
    @desk_number = desk_number
  end

  def check_stock_by_id(record_id)
    result = Record.find(record_id).id
    if result > 10
      return "High"
    elsif result > 4
      return "Medium"
    else
      return "Low"
    end
  end

end
