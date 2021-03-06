

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
        <h1 class="header">  - Fines </h1>
        <div class="body">
                <form class = "admin-form" id = "users-form" action ="/fines/fine" method = post>
                    User ID: <input type="integer" name="user-id-in">
                    <input type="submit" class = 'check-in-button' value="Go">
                </form>
        </div>

    </body>
</html>