from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection
from db.session import get_db
from schema.user import UserCreate, UserResponse
from core.security import hash_password

route = APIRouter()

@route.post(
    "/register", 
    response_model=UserResponse,
    responses={
        400: {"description": "Bad Request - Registration Failed"}
    }
)
async def create_user(make_user: UserCreate, db: Annotated[Connection, Depends(get_db)]):
    hashed_pwd = hash_password(make_user.password)

    # Inalis ko owner id kase aka auto increment naman
    insert_query = text("""
        INSERT INTO owner (owner_username, hashed_password)
        VALUES (:username, :password)
    """)
    
    try:
        result = db.execute(insert_query, {
            "username": make_user.username,
            "password": hashed_pwd
        })
        
        db.commit()
        
        new_id = result.lastrowid
        
        return UserResponse(
            owner_id=new_id,
            owner_username=make_user.username,
        )
    
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=400, detail=f"Database error: {str(error)}")

@route.get(
    "/{owner_id}",
    response_model=UserResponse,
    responses={
        404: {"description": "Not Found - User does not exist"}
    }
)
async def get_user(owner_id: int, db: Annotated[Connection, Depends(get_db)]):
    # Modify nalang if kulang. Pag read lang naman toh data.
    # Pwede to copy sa ibang tables.

    select_query = text("""
        SELECT owner_id, owner_username 
        FROM owner 
        WHERE owner_id = :id
    """)
    
    result = db.execute(select_query, {"id": owner_id}).mappings().fetchone()
    
    if not result:
        raise HTTPException(status_code=404, detail="User not found")
        
    return UserResponse(**result)
