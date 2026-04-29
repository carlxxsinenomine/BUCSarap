from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection
from db.session import get_db
from schema.product import ProductResponse, StallResponse, OrderResponse, CategoryResponse

route = APIRouter()


#Gets all the product category of a stall
@route.get("/{stall_id}", response_model= List[CategoryResponse])
async def get_stall_products(stall_id : int, db: Annotated[Connection, Depends(get_db)]):
    
    #gets all the stall products
    query = text("""
                
                SELECT *
                FROM product_category
                WHERE stall_id = :stall_id
                """)
    
    results = db.execute(query, {"stall_id" : stall_id}).mappings().fetchall()
    return results

#Gets all the products from a category based off of the id
@route.get("/category/{category_id}", response_model= List[ProductResponse])
async def get_products_by_category(category_id : int, db : Annotated[Connection, Depends(get_db)]):
    
    #just matches the category id (unique ang kada category id so no need na yung stall id)
    query = text("""
                 
                SELECT product_id, product_name, product_price, product_status, category_id
                FROM product
                WHERE category_id = :category_id
                """)
    
    results = db.execute(query, {"category_id" : category_id}).mappings().fetchall()
    return results

#gets all the available food in the stall
@route.get("/{stall_id}/available", response_model= List[ProductResponse])
async def get_available_products(stall_id : int, db : Annotated[Connection, Depends(get_db)]):
    
    #joins the product pile and product to get the stall id, and filters it with status 1 (available) and quantity greater than 0
    query = text("""
                 
                
                SELECT *
                FROM product p
                JOIN product_pile pp ON p.product_id = pp.product_id 
                WHERE pp.stall_id = :stall_id AND p.product_status = 1 AND pp.product_quantity > 0
                """)

    results = db.execute(query, {"stall_id" : stall_id}).mappings().fetchall()
    return results