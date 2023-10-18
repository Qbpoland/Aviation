<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Baggage</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Track Baggage</h1>
    </header>

    <nav>
        <ul>
            <li><a href="index.php">Home</a></li>
            <li><a href="flights.php">Flights</a></li>
            <li><a href="tickets.php">Buy Tickets</a></li>
            <li><a href="baggage.php">Track Baggage</a></li>
        </ul>
    </nav>

    <section>
        <h2>Search Baggage</h2>

        <form method="post" action="">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required>

            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required>

            <button type="submit" name="search">Search</button>
        </form>

        <?php
        // Połączenie z bazą danych
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "aviation";

        $conn = new mysqli($servername, $username, $password, $dbname);

        // Sprawdzenie połączenia
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        //zamknięcie połączenia 
        $conn->close();
        ?>
    </section>

    <footer>
        <p>&copy; 2023 Aviation Management System</p>
    </footer>
</body>
</html>

