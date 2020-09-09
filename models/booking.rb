require './models/database_connection'

class Booking
    attr_reader :id, :property_name, :booking_date, :total_price, :name, :email

    def initialize(id:, property_name:, booking_date:, total_price:, name:, email:)
        @id = id
        @property_name = property_name
        @booking_date = booking_date
        @total_price = total_price
        @name = name
        @email = email
      end
    
      def self.create(property_name:, booking_date:, total_price:, name:, email:)
        booking = DatabaseConnection.query(
          "INSERT INTO requests(property_name, booking_date, total_price, name, email) 
          VALUES('#{property_name}','#{booking_date}','#{total_price}','#{name}','#{email}') 
          RETURNING id, property_name, booking_date, total_price, name, email;")
    
        Booking.new(
          id: booking[0]['id'], property_name: booking[0]['property_name'], 
          booking_date: booking[0]['booking_date'], total_price: booking[0]['total_price'], name: booking[0]['name'],
          email: booking[0]['email'])
      end
end 