require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe '#update_quality' do

    describe 'Backstage items' do
      context 'backstage sell_in minus_one' do
        let(:items) { [Item.new('Backstage passes to a TAFKAL80ETC concert', -1, 0)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(-2)
          expect(items[0].quality).to be(0)
        end
      end

      context 'backstage sell_in 10' do
        let(:items) { [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 0)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(9)
          expect(items[0].quality).to be(2)
        end
      end

      context 'backstage sell_in 0' do
        let(:items) { [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 0)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(-1)
          expect(items[0].quality).to be(0)
        end
      end

      context 'backstage quality is 49 and above' do
        let(:items) { [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 0)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(-1)
          expect(items[0].quality).to be(0)
        end
      end
    end

    describe 'Brie items' do
      context 'Brie sell_in minus_one' do
        let(:items) { [Item.new('Aged Brie', 11, 0)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(10)
          expect(items[0].quality).to be(1)
        end
      end

      context 'Brie sell_in 0' do
        let(:items) { [Item.new('Aged Brie', 0, 0)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(-1)
          expect(items[0].quality).to be(2)
        end
      end

      context 'brie quality is 49 and above' do
        let(:items) { [Item.new('Aged Brie', 0, 50)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(-1)
          expect(items[0].quality).to be(50)
        end
      end
    end

    describe 'Sulfuras items' do
      context 'sulfuras sell_in minus_one' do
        let(:items) { [Item.new('Sulfuras, Hand of Ragnaros', -1, 0)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(-1)
          expect(items[0].quality).to be(80)
        end
      end


      context 'when sulfuras sell_in is 10' do
        let(:items) { [Item.new('Sulfuras, Hand of Ragnaros', 10, 0)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(10)
          expect(items[0].quality).to be(80)
        end
      end

      context 'sulfuras quality is 50' do
        let(:items) { [Item.new('Sulfuras, Hand of Ragnaros', 0, 50)] }

        it 'should update item with right value' do
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to be(0)
          expect(items[0].quality).to be(80)
        end
      end
    end

    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end
end
