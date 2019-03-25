

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
        <h1 class="header">  - Check in / Check out </h1>

        <div class="body">
        % if defined('message'):
        <h1 id = 'add-book-message'> {{message}} </h1>
        %end
            <form class = "admin-form" id = "users-form" action ="/in-out/in" method = "post">
                Check In: <br/> <br/>
                User ID: <input type="integer" name="user-id-in"> <br/> <br/>
                Book ID: <input type="integer" name="book-id-in"> <br/> <br/>
                <input type="submit" class = 'check-in-button' value="Go">
            </form>

            <form class = "admin-form" id = "users-form" action ="/in-out/out" method = "post">
                Check Out: <br/> <br/>
                User ID: <input type="integer" name="user-id-out"> <br/> <br/>
                Book ID: <input type="integer" name="book-id-out"> <br/> <br/>
                Time Rented (Days): <input type="integer" name="time-out"> <br/> <br/>
                <input type="submit" class = 'check-in-button' value="Go">
            </form>
        </div>

    </body>
</html>