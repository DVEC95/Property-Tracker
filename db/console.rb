require('pry-byebug')
require_relative('../models/property.rb')

Property.delete_all()

property1 = Property.new({
    'address' => '43 Hall Drive',
    'value' => 60_000,
    'bedrooms' => 2,
    'buy_let_status' => 'to let'
})

property2 = Property.new({
    'address' => 'Castle Hill House',
    'value' => 200_000,
    'bedrooms' => 4,
    'buy_let_status' => 'to buy'
})

property3 = Property.new({
    'address' => '240 Priory Road',
    'value' => 360_000,
    'bedrooms' => 5,
    'buy_let_status' => 'to buy'
})

property1.save()
property2.save()
property3.save()

property1.value = 80_000
property1.update()

property2.delete

binding.pry
nil
