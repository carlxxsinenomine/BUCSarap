from session import engine

try:
    with engine.connect() as conn:
        print("Connected to database successfully!")
except Exception as e:
    print("Connection failed:", e)