import bcrypt

def hash_password(password: str) -> str:
    pwd_bytes = password.encode('utf-8')
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(pwd_bytes, salt)
    
    # Decode back to a normal string so it can be saved in the database
    return hashed_password.decode('utf-8')

def verify_hash(password: str, hashed_pass: str) -> bool:
    # Convert both the login attempt and the database hash into bytes for comparison
    password_byte_enc = password.encode('utf-8')
    hashed_pass_byte_enc = hashed_pass.encode('utf-8')
    
    return bcrypt.checkpw(password_byte_enc, hashed_pass_byte_enc)