# Run niyo sa src (python -m db.auth_cli)

from sqlalchemy import text
from db.session import engine
from core.security import hash_password, verify_hash

def add_account():
    print("\nAdd new acc")
    
    username = input("Enter username: ").strip()
    
    if not username:
        print("Invalid username\n")
        return False
    
    with engine.begin() as conn:
        result = conn.execute(
            text("SELECT owner_id FROM owner WHERE owner_username = :username"),
            {"username": username}
        )
        if result.fetchone():
            print("Username already exists\n")
            return False
    
    password = input("Enter password: ").strip()

    if not password:
        print("Invalid password\n")
        return False
    
    confirm_password = input("Confirm password: ").strip()
    if password != confirm_password:
        print("Passwords do not match\n")
        return False
    
    hashed_password = hash_password(password)
    
    try:
        with engine.begin() as conn:
            conn.execute(
                text("""
                    INSERT INTO owner (owner_username, hashed_password)
                    VALUES (:username, :hashed_password)
                """),
                {"username": username, "hashed_password": hashed_password}
            )
        print("Acc created successfully\n")
        return True
    except Exception:
        print("Error creating account\n")
        return False


def sign_in():
    print("\nLog in acc")
    
    username = input("Enter username: ").strip()
    password = input("Enter password: ").strip()
    
    if not username or not password:
        print("Invalid username or password\n")
        return None
    
    try:
        with engine.begin() as conn:
            result = conn.execute(
                text("SELECT owner_id, hashed_password FROM owner WHERE owner_username = :username"),
                {"username": username}
            )
            owner = result.fetchone()
            
            if not owner:
                print("Username not found\n")
                return None
            
            owner_id, hashed_password = owner
            
            if verify_hash(password, hashed_password):
                print("Logged in successfully\n")
                return owner_id
            else:
                print("Incorrect password\n")
                return None
    except Exception:
        print("Sign in error\n")
        return None


def auth_menu():
    while True:
        print("Menu:")
        print("1. Add Account")
        print("2. Sign In")
        print("3. Exit")
        
        choice = input("Enter your choice (1-3): ").strip()
        
        if choice == "1":
            add_account()
        elif choice == "2":
            owner_id = sign_in()
            if owner_id:
                print(f"Logged in as owner_id: {owner_id}") # La naman ata dito ilalagay na (testing purpose)
                break
        elif choice == "3":
            print("Babye\n")
            break
        else:
            print("Invalid choice\n")


if __name__ == "__main__":
    auth_menu()
