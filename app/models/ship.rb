class Ship
    attr_reader :name, :type, :booty
 
    @@all = []
    
     def initialize(params)
       @name = params[:name]
       @weight = params[:type]
       @height = params[:booty]
       @@all << self
     end
    
     def self.all
       @@all
     end

     def self.clear
        @@all
     end
end