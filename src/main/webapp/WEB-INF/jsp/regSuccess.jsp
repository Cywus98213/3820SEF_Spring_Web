<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vote Successful</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f0f9ff, #ffffff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container {
            max-width: 500px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 2rem;
        }

        h1 {
            font-size: 1.75rem;
            font-weight: 700;
            color: #2563eb;
            margin-bottom: 1rem;
        }

        p {
            font-size: 1rem;
            color: #1e293b;
            margin-bottom: 2rem;
        }

        .btn-home {
            display: inline-block;
            background: #2563eb;
            color: #ffffff;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.3s;
        }

        .btn-home:hover {
            background: #3b82f6;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Register Successfully!</h1>
    <p>Thank you for register. Your account has been created.</p>
    <a href="/login" class="btn-home">Go Login</a>
</div>
</body>
</html>
