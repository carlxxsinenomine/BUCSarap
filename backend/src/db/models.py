from base import Base
from sqlalchemy import Column, Integer, String, Numeric, Boolean, Time, DateTime, ForeignKey
from sqlalchemy.sql import func

class Owner(Base):
    __tablename__ = "owner"
    owner_id = Column(Integer, primary_key=True, autoincrement=True)
    owner_username = Column(String(55), unique=True, nullable=False)
    hashed_password = Column(String(255), nullable=False)

class Stall(Base):
    __tablename__ = "stall"
    stall_id = Column(Integer, primary_key=True, autoincrement=True)
    owner_id = Column(Integer, ForeignKey("owner.owner_id"), nullable=False)
    stall_name = Column(String(100), nullable=False)
    opening_time = Column(Time, nullable=False)
    closing_time = Column(Time, nullable=False)
    operating_days = Column(String(55), nullable=False)
    stall_status = Column(Boolean, default=False)

class ProductCategory(Base):
    __tablename__ = "product_category"
    category_id = Column(Integer, primary_key=True, autoincrement=True)
    stall_id = Column(Integer, ForeignKey("stall.stall_id"), nullable=False)
    category_name = Column(String(100), nullable=False)

class Product(Base):
    __tablename__ = "product"
    product_id = Column(Integer, primary_key=True)
    category_id = Column(Integer, ForeignKey("product_category.category_id"), nullable=False)
    product_name = Column(String(55), nullable=False)
    product_price = Column(Numeric(10,2), nullable=False)
    product_status = Column(Boolean, default=False)

class ProductPile(Base):
    __tablename__ = "product_pile"
    product_pile_id = Column(Integer, primary_key=True, autoincrement=True)
    product_id = Column(Integer, ForeignKey("product.product_id"), nullable=False)
    stall_id = Column(Integer, ForeignKey("stall.stall_id"), nullable=False)
    product_quantity = Column(Integer, nullable=False)

class Order(Base):
    __tablename__ = "orders"
    order_id = Column(Integer, primary_key=True, autoincrement=True)
    product_pile_id = Column(Integer, ForeignKey("product_pile.product_pile_id"), nullable=False)
    stall_id = Column(Integer, ForeignKey("stall.stall_id"), nullable=False)
    order_number = Column(String(50), unique=True, nullable=False)
    order_status = Column(String(50))
    order_time = Column(DateTime, server_default=func.now())
    processing_time = Column(DateTime, nullable=True)
    customer_name = Column(String(55))

class History(Base):
    __tablename__ = "history"
    owner_id = Column(Integer, ForeignKey("owner.owner_id"), primary_key=True)
    order_id = Column(Integer, ForeignKey("orders.order_id"), primary_key=True)