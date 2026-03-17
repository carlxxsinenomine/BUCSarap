from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from db.session import session as DbSession 
from schema.user import UserCreate, UserResponse
from models.user import User
from core.security import hash_password

route = APIRouter()

def get_db():
    db = DbSession
    try:
        yield db
    finally:
        db.close()