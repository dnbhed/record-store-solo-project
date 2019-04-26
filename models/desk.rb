require_relative('record')

class Desk

  def initialize(desk_number)
    @desk_number = desk_number
  end

  def check_stock_by_id(record_id)
    return Record.find(record_id).id
  end

end
