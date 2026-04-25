# This dictates what should the frontend only request and what backend sends back. 
from pydantic import BaseModel, Field, ConfigDict

class UserCreate(BaseModel):
    # Ensures properformatting and needs for registration for new users
    username: str = Field(min_length=3, max_length=50, description="Please enter a valid name")
    password: str = Field(min_length=8, description="Please enter a strong and valid password")

class UserResponse(BaseModel):
    owner_id: int
    owner_username: str

    # Translates default dictionaries to objects. This prevents app crash 
    model_config = ConfigDict(from_attributes = True)
