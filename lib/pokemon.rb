class Pokemon
    attr_accessor :name, :type, :db 
    attr_reader :id 

    def initialize(name:, type:, db:, id: nil)
        @name = name 
        @type = type 
        @db = db 
        @id = id 
    end 

    def self.save(name, type, db)
        binding.pry
       sql = <<-SQL
            INSERT INTO pokemon(name, type)
            VALUES (?, ?)
       SQL
        db.execute(sql, name, type)
    end 

    def self.find(id, db) 
        pokemon_finder = db.execute("SELECT * FROM pokemon WHERE id = ?", id) 
            self.new(id: pokemon_finder[0][0], name: pokemon_finder[0][1], type: pokemon_finder[0][2], db:db)
    end
end
