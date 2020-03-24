require ('pg')

class Property

  attr_accessor :address, :value, :bedrooms, :buy_let_status
  attr_reader :id

  def initialize(properties)
    @address = properties['address']
    @value = properties['value']
    @bedrooms = properties['bedrooms']
    @buy_let_status = properties['buy_let_status']
    @id = properties['id'].to_i if properties['id']
  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO properties
      (
        address,
        value,
        bedrooms,
        buy_let_status
      )
      VALUES
      (
        $1, $2, $3, $4
      )
      RETURNING *"
    values = [@address, @value, @bedrooms, @buy_let_status]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close
  end

  def update()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "UPDATE properties
      SET
      (
        address,
        value,
        bedrooms,
        buy_let_status
      )
      =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@address, @value, @bedrooms, @buy_let_status, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close
  end

end
