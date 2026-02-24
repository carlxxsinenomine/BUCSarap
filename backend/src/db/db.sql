CREATE TABLE owner (
  owner_id int PRIMARY KEY,
  owner_username varchar(55) UNIQUE NOT NULL,
  hashed_password varchar(55) NOT NULL
);

CREATE TABLE stall (
  stall_id int PRIMARY KEY,
  stall_name varchar(55) NOT NULL,
  operating_days varchar(55) NOT NULL,
  opening_time time NOT NULL,
  closing_time time NOT NULL,
  is_available bool DEFAULT false,
  FOREIGN KEY (stall_id) REFERENCES owner(owner_id)
);

CREATE TABLE product (
  product_id int PRIMARY KEY,
  product_name varchar(55) NOT NULL,
  price decimal(10,2) NOT NULL,
  is_available bool DEFAULT false,
  FOREIGN KEY (product_id) REFERENCES stall(stall_id)
);

CREATE TABLE customer (
  order_id int PRIMARY KEY AUTO_INCREMENT,
  customer_name varchar(55),
  order_serial varchar(55) NOT NULL,
  order_time timestamp NOT NULL,
  total_cost decimal(10,2) NOT NULL,
  status varchar(55) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES product(product_id)
);