require ('pg')

class Property

  attr_accessor :address, :value, :bedrooms, :buy_let_status

  def initialize(properties)
    @address = properties['address']
    @value = properties['value']
    @bedrooms = properties['bedrooms']
    @buy_let_status = properties['buy_let_status']
  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO properties
      (
        address,
        value,
        bedrooms,
        buy_let_status
      )"
    # db.prepare("save", sql)
    db.close
  end

end
