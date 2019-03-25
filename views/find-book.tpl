
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
        <h1 id="mini-title">  <a href = '/' class='main-title-link'> The Empty Library</a> </h1>
        <h1 class="header">  - Books - Search </h1>

        <div class="body">
            <table style="width:100%" id="search-table">
                <tr>
                    <td> ID </td>
                    <td> Title </td>
                    <td> Author </td>
                    <td> Author ID </td>
                    <td> Out? </td>
                    <td> Date Due Back </td>
                    <td> Rented by (User ID) </td>

                </tr>

                % for i in range(number_results):
                    %user = book_list[i]
                    <tr>
                        <td> {{user[0]}} </td>
                        <td> {{user[1]}} </td>
                        <td> {{user[4]}} </td>
                        <td> {{user[2]}} </td>
                        <td> {{user[3]}} </td>
                        <td> {{user[5]}} </td>
                        <td> {{user[6]}} </td>
                    </tr>
                % end
            </table>
        </div>