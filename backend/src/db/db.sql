CREATE TABLE owner (
  owner_id int PRIMARY KEY AUTO_INCREMENT,
  owner_username varchar(55) UNIQUE NOT NULL,
  hashed_password varchar(255) NOT NULL
);

CREATE TABLE stall (
  stall_id int PRIMARY KEY AUTO_INCREMENT,
  stall_name varchar(100) NOT NULL,
  operating_days varchar(55) NOT NULL,
  opening_time time NOT NULL,
  closing_time time NOT NULL,
  operating_days varchar(55) NOT NULL,
  stall_status bool DEFAULT false,
  FOREIGN KEY (stall_id) REFERENCES owner(owner_id)
);

CREATE TABLE product_category (  
  category_id int PRIMARY KEY AUTO_INCREMENT,
  stall_id int NOT NULL,
  category_name varchar(100) NOT NULL,
  FOREIGN KEY (stall_id) REFERENCES stall(stall_id)
); 

CREATE TABLE product (
  product_id int PRIMARY KEY,
  category_id int NOT NULL,
  product_name varchar(55) NOT NULL,
  product_price decimal(10,2) NOT NULL,
  product_status bool DEFAULT false,
  FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

CREATE TABLE product_pile (
  product_pile_id int PRIMARY KEY AUTO_INCREMENT,
  product_id int NOT NULL,
  stall_id int NOT NULL,
  product_quantity int NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE order (
  order_id int PRIMARY KEY AUTO_INCREMENT,
  product_pile_id int NOT NULL,
  stall_id int NOT NULL,
  order_number varchar(50) UNIQUE NOT NULL,
  order_status varchar(50),
  order_time timestamp DEFAULT CURRENT_TIMESTAMP,
  processing_time timestamp,
  customer_name varchar(55),
  FOREIGN KEY (product_pile_id) REFERENCES product_pile(product_pile_id)
);

CREATE TABLE history (
  owner_id int,
  order_id int,
  PRIMARY KEY (owner_id, order_id),
  FOREIGN KEY (owner_id) REFERENCES owner(owner_id),
  FOREIGN KEY (order_id) REFERENCES order(order_id)
);
