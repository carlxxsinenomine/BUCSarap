# This allows SQL and Py to interact with eachother
# This is a set up, ikaw na Sean maayos neto


# Check moto Sean: https://medium.com/@tclaitken/setting-up-a-fastapi-app-with-async-sqlalchemy-2-0-pydantic-v2-e6c540be4308
# Diretso kana sa database sesssion part, ung connection function lang need natin nde na nung session (pero lagay mopadin) since raw SQL queries need natin. 
# Ung session kasi for ORM lang.
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.engine import URL
import os
from dotenv import load_dotenv

load_dotenv()
db_pass = os.getenv("DB_PASSWORD")

url = URL.create(
    drivername="mysql+pymysql",
    username="root", #Change later for security
    password=db_pass, 
    host="localhost",
    database="buCSarapDB",
    port=3306
)

engine = create_engine(url)
Session = sessionmaker(bind=engine)
session = Session()


