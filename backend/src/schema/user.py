# This dictates what should the frontend only request and what backend sends back. 
from pydantic import BaseModel, Field
from uuid import UUID 

# Input schema
class UserCreate(BaseModel):
    username: str = Field(min_length=3, max_length=50, description="Please enter a valid name")
    password: str = Field(min_length=8, description="Please enter a strong and valid password")

# Output schema
class UserResponse(BaseModel):
    id: UUID
    username: str

    # Translates default dictionaries to objects
    #  This prevents app crash 
    class ConfigDict:
        from_attributes = True