
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
        <h1 class="header">  - Users - Search </h1>

        <div class="body">
            <table style="width:100%" id="search-table">
                <tr>
                    <td> ID </td>
                    <td> First Name </td>
                    <td> Second Name </td>
                    <td> Fine </td>
                </tr>

                % for i in range(number_results):
                    %user = user_list[i]
                    <tr>
                        <td> {{user[0]}} </td>
                        <td> {{user[1]}} </td>
                        <td> {{user[2]}} </td>
                        <td> {{user[3]}} </td>
                    </tr>
                % end
            </table>
        </div>