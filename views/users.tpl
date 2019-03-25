
<html>
    <head>
        <title> The Empty Library </title>
            <link rel="stylesheet" href="/views/Home.css">
    </head>
    
    <body>
            <div class="nav-bar">
                    <h2 id = 'admins'> 
                        Administrators
                        <a href = '/books'><button class = 'dark-button'>Books</button></a>
                        <a href = '/users'><button class = 'dark-button'>Users</button></a>
                        <a href = '/in-out'><button class = 'dark-button'>Check in/out</button></a>
                        <a href = '/fines'><button class = 'dark-button'>Pay fines</button></a>
                    </h2>
                </div>

        

        <p><button id="account-button">My Account</button></p>
        <h1 id="mini-title">  <a href = '/' class='main-title-link'> The Empty Library</a> </h1>
        <h1 class="header">  - Users </h1>
        <div class="body">
            <form class = "admin-form" action ="/users/add" id = 'users-form' method = 'post'>
                Add User <br/> <br/>
                User First Name: <input type="integer" name="user-first-name-in"> <br/> <br/>
                User Second Name: <input type="integer" name="user-second-name-in"> <br/> <br/>
                User Date of Birth (YYYY/MM/DD): <input type="integer" name="user-age-in"> <br/> <br/>
                <input type="submit" class = 'check-in-button' value="Go">
            </form>

            <h1 id = 'add-book-message'> {{user_message}} </h1>

            <form class = "admin-form" action ="/users/search" id = 'users-form' method = 'post'>
                Find User <br/> <br/>
                <input type="integer" name="search-in"> <br/> <br/>
                <input type="submit" class = 'check-in-button' value="Go">
            </form>
        </div>

    </body>
</html>