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
            --input-focus: #93c5fd;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #e0f2fe, #f0f9ff);
            min-height: 100vh;
            display: grid;
            place-items: center;
            margin: 0;
        }

        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            width: 400px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 2rem;
            text-align: center;
            border-radius: 15px 15px 0 0;
        }

        h2 {
            font-weight: 800;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .form-control {
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            padding: 0.75rem 1.25rem;
            transition: all 0.3s ease;
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

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border: none;
            padding: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(59, 130, 246, 0.2);
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .additional-links {
            text-align: center;
            margin-top: 1.5rem;
            color: #64748b;
        }

        .additional-links a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center">
    <div class="card">
        <div class="card-header">
            <h2>Welcome Back</h2>
        </div>
        <div class="card-body p-4">
            <form action="/login" method="POST">
                <div class="mb-4 position-relative">
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" class="form-control ps-5"
                           id="username" name="username"
                           placeholder="Enter your username" required>
                </div>

                <div class="mb-4 position-relative">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" class="form-control ps-5"
                           id="password" name="password"
                           placeholder="Enter your password" required>
                </div>

                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input"
                           id="remember-me" name="remember-me">
                    <label class="form-check-label" for="remember-me">
                        Remember Me
                    </label>
                </div>

                <div class="d-grid mb-3">
                    <button type="submit" class="btn btn-primary">
                        Sign In
                    </button>
                </div>

                <div class="additional-links">
                    <a href="#forgot-password">Forgot Password?</a><br>
                    <span class="mt-2 d-inline-block">
                        Don't have an account?
                        <a href="#signup">Sign Up</a>
                    </span>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>