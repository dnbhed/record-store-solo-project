require("minitest/autorun")
require('minitest/rg')
require_relative('../record.rb')

class RecordTest < MiniTest::Test

  def setup()
    @record1 = Record.new({
      'title' => 'Back to Basics',
      'stock' => '3',
      'buy_price' => '1',
      'sell_price' => '10',
      'vinyl_wav' => 'false'
      })
    @record2 = Record.new({
      'title' => 'High Society',
      'stock' => '10',
      'buy_price' => '3',
      'sell_price' => '6',
      'vinyl_wav' => 'true'
      })
  end

  def test_record_is_vinyl()
    assert_equal('Vinyl', @record2.check_type)
  end

end
