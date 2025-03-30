<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register</title>
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

        .role-selection {
            margin: 1.5rem 0;
            padding: 1rem;
            background: var(--input-bg);
            border-radius: 12px;
        }

        .form-check-input[type="radio"] {
            border: 2px solid #e2e8f0;
            width: 1.2em;
            height: 1.2em;
            margin-right: 0.5rem;
        }

        .form-check-input[type="radio"]:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .form-check-label {
            color: var(--text-dark);
            font-weight: 500;
        }

        #teacherPasscode {
            display: none;
            margin-top: 1rem;
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
        <h1 class="auth-title">Create Account</h1>
        <p>Join as Student or Teacher</p>
    </div>

    <form action="/register" method="POST">
        <!-- Role Selection -->
        <div class="role-selection">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="roles" id="studentRole" value="student" checked>
                <label class="form-check-label" for="studentRole">
                    <i class="fas fa-user-graduate"></i> Student
                </label>
            </div>
            <div class="form-check mt-2">
                <input class="form-check-input" type="radio" name="roles" id="teacherRole" value="teacher">
                <label class="form-check-label" for="teacherRole">
                    <i class="fas fa-chalkboard-teacher"></i> Teacher
                </label>
            </div>
        </div>

        <!-- Teacher Passcode -->
        <div id="teacherPasscode" class="mb-4 position-relative">
            <i class="fas fa-key input-icon"></i>
            <input type="password" class="form-control"
                   id="passcode" name="passcode"
                   placeholder="Enter teacher passcode">
        </div>

        <!-- Full Name -->
        <div class="mb-4 position-relative">
            <i class="fas fa-id-card input-icon"></i>
            <input type="text" class="form-control"
                   id="full_name" name="full_name"
                   placeholder="Full name" required>
        </div>

        <!-- Username -->
        <div class="mb-4 position-relative">
            <i class="fas fa-user input-icon"></i>
            <input type="text" class="form-control"
                   id="username" name="username"
                   placeholder="Choose username" required>
        </div>

        <!-- Email -->
        <div class="mb-4 position-relative">
            <i class="fas fa-envelope input-icon"></i>
            <input type="email" class="form-control"
                   id="email" name="email"
                   placeholder="Email address" required>
        </div>

        <!-- Phone Number -->
        <div class="mb-4 position-relative">
            <i class="fas fa-phone input-icon"></i>
            <input type="tel" class="form-control"
                   id="phone_number" name="phone_number"
                   placeholder="Phone number"
                   pattern="\d{8}">
        </div>

        <!-- Password -->
        <div class="mb-4 position-relative">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" class="form-control"
                   id="password" name="password"
                   placeholder="Create password" required>
        </div>

        <!-- Confirm Password -->
        <div class="mb-4 position-relative">
            <i class="fas fa-check-circle input-icon"></i>
            <input type="password" class="form-control"
                   id="confirm_password" name="confirm_password"
                   placeholder="Confirm password" required>
        </div>

        <button type="submit" class="btn-auth">
            <i class="fas fa-user-plus"></i>
            Create Account
        </button>

        <div class="auth-links">
            <p class="mt-3">Already registered? <a href="/login">Sign in here</a></p>
        </div>
    </form>
</div>

<script>
    // Toggle teacher passcode field
    document.addEventListener('DOMContentLoaded', function() {
        const roleRadios = document.querySelectorAll('input[name="roles"]');
        const passcodeField = document.getElementById('teacherPasscode');
        const passcodeInput = document.getElementById('teacher_code');

        function togglePasscodeField() {
            if (document.getElementById('teacherRole').checked) {
                passcodeField.style.display = 'block';
                passcodeInput.setAttribute('required', '');
            } else {
                passcodeField.style.display = 'none';
                passcodeInput.removeAttribute('required');
            }
        }

        roleRadios.forEach(radio => {
            radio.addEventListener('change', togglePasscodeField);
        });

        // Initial check
        togglePasscodeField();
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>