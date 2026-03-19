from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from db.session import engine
from routers import users, products

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # Replace "*" later with the frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register isolated route
app.include_router(users.route, prefix="/users", tags=["Users"])

# Remove comment on the bottom code later, wala pa kase sa products
#app.include_router(products.route, prefix="/products", tags=["Products"])