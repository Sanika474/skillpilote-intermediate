<?php
// Database configuration
$host = "localhost";
$dbname = "skillpilote_lamp";
$username = "lampuser";
$password = getenv("DB_PASSWORD");

if (!$password) {
    die("Database configuration is missing.");
}

// Connect to MariaDB
$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Database connection failed.");
}

$result = $conn->query("SELECT * FROM visitors");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillPilote LAMP Stack</title>
</head>
<body>
    <h1>SkillPilote - LAMP Stack Deployment</h1>
    <p>Successfully deployed on AWS EC2.</p>

    <h2>Database Visitors</h2>

    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Created At</th>
        </tr>

        <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?= htmlspecialchars($row['id']) ?></td>
            <td><?= htmlspecialchars($row['name']) ?></td>
            <td><?= htmlspecialchars($row['email']) ?></td>
            <td><?= htmlspecialchars($row['created_at']) ?></td>
        </tr>
        <?php endwhile; ?>
    </table>

    <h3>Technology Stack</h3>
    <p>Linux | Apache | MariaDB | PHP</p>
</body>
</html>

<?php $conn->close(); ?>