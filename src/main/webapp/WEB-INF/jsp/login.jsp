<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb;
            --accent-color: #3b82f6;
            --text-dark: #1e293b;
            --input-bg: #f8fafc;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f0f9ff, #ffffff);
            min-height: 100vh;
            display: grid;
            place-items: center;
            margin: 0;
            padding: 2rem;
        }

        .auth-card {
            width: 400px;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.08);
            padding: 2.5rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .auth-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.1);
        }

        .auth-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .auth-title {
            color: var(--text-dark);
            font-weight: 800;
            font-size: 2rem;
            margin-bottom: 1rem;
            position: relative;
            padding-bottom: 1.5rem;
        }

        .auth-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color) 0%, rgba(59,130,246,0.2) 100%);
            border-radius: 2px;
        }

        .form-control {
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 1rem 1.5rem 1rem 3rem;
            background: var(--input-bg);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
        }

        .input-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #64748b;
            z-index: 2;
        }

        .btn-auth {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border: none;
            border-radius: 12px;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-auth:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
        }

        .auth-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 1.5rem 0;
        }

        .form-check-input {
            border: 2px solid #e2e8f0;
            width: 1.2em;
            height: 1.2em;
            margin-top: 0;
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .auth-links {
            text-align: center;
            margin-top: 2rem;
            color: #64748b;
        }

        .auth-links a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .auth-links a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .auth-card {
                width: 100%;
                padding: 1.5rem;
            }

            .auth-title {
                font-size: 1.75rem;
            }
        }
    </style>
</head>
<body>
<div class="auth-card">
    <div class="auth-header">
        <h1 class="auth-title">Welcome Back</h1>
        <p>Sign in to continue</p>
    </div>

    <form action="/login" method="POST">
        <div class="mb-4 position-relative">
            <i class="fas fa-user input-icon"></i>
            <input type="text" class="form-control"
                   id="username" name="username"
                   placeholder="Enter your username" required>
        </div>

        <div class="mb-4 position-relative">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" class="form-control"
                   id="password" name="password"
                   placeholder="Enter your password" required>
        </div>

        <div class="auth-options">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="remember-me" name="remember-me">
                <label class="form-check-label" for="remember-me">Remember me</label>
            </div>
            <a href="#forgot-password" class="text-decoration-none">Forgot password?</a>
        </div>

        <button type="submit" class="btn-auth">
            <i class="fas fa-sign-in-alt"></i>
            Sign In
        </button>

        <div class="auth-links">
            <p class="mt-3">Don't have an account? <a href="#signup">Create account</a></p>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>