CREATE TABLE confirmations(id SERIAL PRIMARY KEY, property_id INT references spaces(id), booking_date DATE);