class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item| ItemService.update(item) }
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class ItemService
  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def self.update(item)
    case item.name
    when 'Backstage passes to a TAFKAL80ETC concert'
      Backstage.new(item).update
    when 'Aged Brie'
      Brie.new(item).update
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras.new(item)
    else
      # raise not supported
    end
  end

  def update
    update_sell_in
    update_quality
  end

  def update_sell_in
    item.sell_in = item.sell_in - 1
  end

  def update_quality; end
end

class Backstage < ItemService
  def update_quality
    return item.quality = 0 if item.sell_in >= 49

    item.quality += \
      case item.sell_in
      when 0...6
        3
      when 6...10
        2
      when 10..
        1
      else
        0
      end
  end
end

class Brie < ItemService
  def update_quality
    item.quality = item.quality + 1 if item.quality < 50 && (item.sell_in <= 0)
    item.quality = item.quality + 1 unless item.quality >= 50
  end
end

class Sulfuras < ItemService

  def initialize(item)
    item.quality = 80
    super(item)
  end
end
