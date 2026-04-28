from sqlalchemy import text
from session import engine

def create_tables():
    drop_statements = [
        "DROP TABLE IF EXISTS history",
        "DROP TABLE IF EXISTS order_item",
        "DROP TABLE IF EXISTS orders",
        "DROP TABLE IF EXISTS product_pile",
        "DROP TABLE IF EXISTS product",
        "DROP TABLE IF EXISTS product_category",
        "DROP TABLE IF EXISTS stall",
        "DROP TABLE IF EXISTS owner"
    ]
    
    create_statements = [
        """
        CREATE TABLE owner (
            owner_id int PRIMARY KEY AUTO_INCREMENT,
            owner_username varchar(55) UNIQUE NOT NULL,
            hashed_password varchar(255) NOT NULL
        )
        """,
        """
        CREATE TABLE stall (
            stall_id int PRIMARY KEY AUTO_INCREMENT,
            owner_id int NOT NULL,
            stall_name varchar(100) NOT NULL,
            opening_time time NOT NULL,
            closing_time time NOT NULL,
            operating_days varchar(55) NOT NULL,
            stall_status bool DEFAULT false,
            photo_path varchar(255) NOT NULL,
            FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
        )
        """,
        """
        CREATE TABLE product_category (
            category_id int PRIMARY KEY AUTO_INCREMENT,
            stall_id int NOT NULL,
            category_name varchar(100) NOT NULL,
            FOREIGN KEY (stall_id) REFERENCES stall(stall_id)
        )
        """,
        """
        CREATE TABLE product (
            product_id int PRIMARY KEY,
            category_id int NOT NULL,
            product_name varchar(55) NOT NULL,
            product_price decimal(10,2) NOT NULL,
            product_status bool DEFAULT false,
            photo_path varchar(255) NOT NULL,
            FOREIGN KEY (category_id) REFERENCES product_category(category_id)
        )
        """,
        """
        CREATE TABLE product_pile (
            product_pile_id int PRIMARY KEY AUTO_INCREMENT,
            product_id int NOT NULL,
            stall_id int NOT NULL,
            product_quantity int NOT NULL,
            FOREIGN KEY (product_id) REFERENCES product(product_id),
            FOREIGN KEY (stall_id) REFERENCES stall(stall_id)
        )
        """,
        """
        CREATE TABLE orders (
            order_id int PRIMARY KEY AUTO_INCREMENT,
            stall_id int NOT NULL,
            order_number varchar(50) NOT NULL,
            order_status varchar(50) DEFAULT 'Pending',
            order_time timestamp DEFAULT CURRENT_TIMESTAMP,
            processing_time int,
            customer_name varchar(55),
            FOREIGN KEY (stall_id) REFERENCES stall(stall_id)
        )
        """,
        """
        CREATE TABLE order_item (
            order_item_id int PRIMARY KEY AUTO_INCREMENT,
            order_id int NOT NULL,
            product_pile_id int NOT NULL,
            FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
            FOREIGN KEY (product_pile_id) REFERENCES product_pile(product_pile_id)
        )
        """,
        """
        CREATE TABLE history (
            owner_id int,
            order_id int,
            PRIMARY KEY (owner_id, order_id),
            FOREIGN KEY (owner_id) REFERENCES owner(owner_id),
            FOREIGN KEY (order_id) REFERENCES orders(order_id)
        )
        """
    ]
    
    with engine.begin() as conn:
        for drop_sql in drop_statements:
            conn.execute(text(drop_sql))
        
        for create_sql in create_statements:
            conn.execute(text(create_sql))

if __name__ == "__main__":
    create_tables()
    print("Gumagana")