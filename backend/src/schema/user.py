# This dictates what should the frontend only request and what backend sends back. 
from pydantic import BaseModel, Field, ConfigDict
from uuid import UUID 

class UserCreate(BaseModel):
    # Ensures properformatting and needs for registration for new users
    username: str = Field(min_length=3, max_length=50, description="Please enter a valid name")
    full_name: str = Field(min_length=2, max_length=100, description="Please enter your full name")
    password: str = Field(min_length=8, description="Please enter a strong and valid password")

class UserResponse(BaseModel):
    owner_id: UUID
    owner_username: str
    full_name: str

    # Translates default dictionaries to objects. This prevents app crash 
    model_config = ConfigDict(from_attributes = True)
