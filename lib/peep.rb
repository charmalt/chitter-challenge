require './lib/database'
require './lib/user'

class Peep

  attr_reader :id, :text, :time

  def initialize(id = id, text = text, time = Time.now.asctime)
    @id = id
    @text = text
    @time = time
  end

  def ==(other)
    (self.id == other.id)
  end

  def self.create(text, time = Time.now.asctime)
    result = Database.query(
      "INSERT INTO peeps (text, time)
       VALUES('#{text}', '#{time}') RETURNING id, text, time"
    )
    Peep.new(result.first['id'], result.first['text'], result.first['time'])
  end

  def self.all
    rs = Database.query("SELECT * FROM peeps")
    rs.map { |result| Peep.new(result['id'], result['text'], result['time'])}.reverse
  end

end
