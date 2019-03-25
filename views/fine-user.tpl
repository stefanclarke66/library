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
        <h1 class="header">  - Fines - Fine User </h1>
        <div class="body">
        <h1 id = 'add-book-message'> {{message}} </h1>
            <h1 id = 'fine'>
                User ID : {{user_ID}} <br/><br/>
                User Name : {{user_first_name}} {{user_second_name}} <br/><br/>
                Total Fine: {{user_fine}} <br/><br/>
            </h1>

            <form class = "admin-form" id = "users-form" action ="/fines/fine/submit" method = post>
                Fine Paid: <input type="integer" name="fine_value">
                <input type="hidden" name="user_id" value={{user_ID}}>
                <input type="submit" class = 'check-in-button' value="Go">
                %user_ID = user_ID
            </form>

        </div>

    </body>
</html>
