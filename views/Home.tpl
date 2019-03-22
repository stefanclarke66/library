

<html>
    <head>
        <title> The Empty Library </title>
        <link rel="stylesheet" href="/views/home.css">
        <link rel="stylesheet" href="/views/home.css">
    </head>
    
    <body>
            <div class="nav-bar">
                    <h2 id = 'admins'> 
                        Administrators
                        &nbsp;&nbsp;<a href = '/books'><button class = 'dark-button'>Books</button></a>
                        &nbsp;&nbsp;<a href = '/users'><button class = 'dark-button'>Users</button></a>
                        &nbsp;&nbsp;<a href = '/in-out'><button class = 'dark-button'>Check in/out</button></a>
                        &nbsp;&nbsp;<a href = '/fines'><button class = 'dark-button'>Pay fines</button></a>
                    </h2>
                </div>

        <p><button id="account-button">My Account</button></p>
        <br>
        <br>
        <br>
        <br>

        <h1 id="main-title">  <a href = '/' class='main-title-link'> The Empty Library</a> </h1>
        <form id = "search" action ="/">
            Search: <input type="text" name="search_request">
            <input type="submit" value="Go">
        </form>
        <a href = '/categories'><button class = 'light-button' id="category-button">Browse by Category</button></a>
        <button class = 'light-button' id="recommended-button">Browse Recommended</button>

    </body>
</html>
