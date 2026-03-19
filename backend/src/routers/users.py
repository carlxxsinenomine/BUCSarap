from typing import Annotated
import uuid

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text
from sqlalchemy.orm import Session
from db.session import session as DbSession 
from schema.user import UserCreate, UserResponse
from models.user import User
from core.security import hash_password

route = APIRouter()

def get_db():
    db = DbSession()
    try:
        yield db
    finally:
        db.close()

# API endpoints
@route.post(
    "/register", 
    response_model=UserResponse,
    # Document the expected error format for the SwaggerUI
    responses={
        400: {
            "description": "Bad Request - Registration Failed",
            "content": {
                "application/json": {
                    "example": {"detail": "Database error: Username already exists"}
                }
            }
        }
    }
)

async def create_user(make_user: UserCreate, db: Annotated[Session, Depends(get_db)]):
    new_id = str(uuid.uuid4())
    hashed_pwd = hash_password(make_user.password)

    insert_query = text("""INSERT INTO owner(owner_id, owner_username, full_name, hashed_password)
                        VALUES(:id, :username, :full_name, :password)
                        """)
    try:
        db.execute(insert_query, {
            "id": new_id,
            "username": make_user.username,
            "full_name": make_user.full_name,
            "password": hashed_pwd
        })
        db.commit()
        
        return UserResponse(
            owner_id=new_id,
            owner_username=make_user.username,
            full_name=make_user.full_name,
        )
    
    except Exception as error:
        db.rollback()

        raise HTTPException(status_code=400, detail=f"{error}") from error
    