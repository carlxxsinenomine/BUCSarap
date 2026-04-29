from pydantic import BaseModel
from decimal import Decimal
from typing import Optional

class ProductResponse(BaseModel):

    product_id : int
    product_name : str
    product_price : Decimal
    product_status : bool
    category_id : int
    
class CategoryResponse(BaseModel):
    category_id: int
    category_name: str
    stall_id: int
    
class StallResponse(BaseModel):
    
    stall_id : int
    stall_name : str
    owner_id : int
    opening_time : str
    closing_time : str
    operating_days : str
    stall_status : bool
    
class OrderResponse(BaseModel):

    order_id : int
    order_number: str
    order_status: str
    customer_name: Optional[str]
    stall_id: int
    