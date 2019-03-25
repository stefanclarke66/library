
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
        <h1 class="header">  - Books </h1>
        <div class="body"> 

        <h1 id = 'add-book-message'> {{add_remove_message}} </h1>
            
            <form class = "admin-form" id = "users-form" action ="/books/search" method="post">
                Find Book <br/> <br/>
                <input type="integer" name="find-book">
                <input type="submit" class = 'check-in-button' value="Go">
            </form> 


            <form class = "admin-form" id = "users-form" action ="/books/add" method="post">
                Add Book <br/> <br/>
                Book Name: <input type="integer" name="add-book-name"> <br/> <br/>
                Author ID: <input type="integer" name="add-author-id"> <br/> <br/>
                Genre ID: <input type="integer" name="add-genre-id"> <br/> <br/>
                Description: <input type="integer" name="add-description"> <br/> <br/>
                Goodreads ID: <input type="integer" name="add-goodreads-id"> <br/> <br/>
                <input type="submit" class = 'check-in-button' value="Go">
            </form> 
        


            <form class = "admin-form" id = "users-form" action ="/books/remove" method="post">
                Remove Book <br/> <br/>
                Book ID: <input type="integer" name="remove-book-id"> <br/> <br/>
                <input type="submit" class = 'check-in-button' value="Go">
            </form>


            <form class = "admin-form" id = "users-form" action ="/books/add_author" method="post">
                Add Author <br/> <br/>
                Author First Name: <input type="integer" name="author-first-name"> <br/> <br/>
                Author Second Name: <input type="integer" name="author-second-name"> <br/> <br/>
                <input type="submit" class = 'check-in-button' value="Go">
            </form>


        </div>

    </body>
</html>