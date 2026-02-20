TODO 1: Identify our data models ( What are the data we're gonna work on as well as their type. ) <br/>
TODO 2: Decide what database to use Postgres or MySQL.<br/>
        If Postgres, we could simply just download the app. If MySQL XAMPP tayo or kung ano ginamit mo Geb MySQL gamit mo sa USMAQ diba? Additionally, If ayaw nyo magdownload ng sofwares we could just Dockerize the Postgres. <br/>
TODO 3: If the data models are finalized then create models for each entity [Check my repo for reference](https://github.com/carlxxsinenomine/AutoNode/blob/main/backend/app/models/user.py)<br/>
TODO 4: Create database on either Postgres or MySQL(XAMPP) Why XAMPP? ala lang<br/>
TODO 5: Create the Database tables for each entity [Check my repo. May link din jan nung pinagkuhaan ko ng resources](https://github.com/carlxxsinenomine/AutoNode/blob/main/backend/app/config/create_database.py)<br/>
TODO 6: Create a Async database session for async operations [See my repo for referncce](https://github.com/carlxxsinenomine/AutoNode/blob/main/backend/app/config/database.py)<br/>
        In TODO 6 on my repo, if we are required to use raw SQL operation you you can use the connect(), else if not then use teh session().


        