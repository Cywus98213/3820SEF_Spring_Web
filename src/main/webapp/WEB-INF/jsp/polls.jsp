<!DOCTYPE html>
<html lang="en">
<head>
    <title>Poll</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2563eb;
            --accent-color: #3b82f6;
            --text-dark: #1e293b;
            --success-green: #22c55e;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f0f9ff, #ffffff);
            min-height: 100vh;
            padding: 2rem;
            color: var(--text-dark);
        }

        .container {
            max-width: 800px;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.08);
            padding: 3rem;
            margin: 0 auto;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: var(--text-dark);
            font-weight: 800;
            margin-bottom: 2.5rem;
            position: relative;
            padding-bottom: 1.5rem;
            font-size: 2.25rem;
            line-height: 1.2;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color) 0%, rgba(59,130,246,0.2) 100%);
            border-radius: 2px;
        }

        .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: transparent;
            color: var(--primary-color);
            font-weight: 600;
            padding: 0.75rem 1.25rem;
            border: 2px solid var(--primary-color);
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.2s ease;
            margin-bottom: 2rem;
        }

        .btn-back:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-1.5px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
        }

        .options-container {
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
            margin: 2.5rem 0;
        }

        .option-btn {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem;
            background: #f8fafc;
            border: 2px solid transparent;
            border-radius: 14px;
            color: var(--text-dark);
            font-weight: 500;
            text-align: left;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 3px 9px rgba(0, 0, 0, 0.03);
            position: relative;
            overflow: hidden;
        }

        .option-btn:hover:not(:disabled) {
            background: #eff6ff;
            transform: translateY(-3px);
            border-color: var(--primary-color);
            box-shadow: 0 6px 18px rgba(59, 130, 246, 0.12);
        }

        .option-btn:disabled {
            background: #f1f5f9;
            color: #94a3b8;
            cursor: not-allowed;
            transform: none;
        }

        .vote-count {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 600;
            color: var(--primary-color);
            background: rgba(219, 234, 254, 0.5);
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.9em;
            min-width: 80px;
            justify-content: center;
        }

        .btn-edit {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: transparent;
            color: var(--primary-color);
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            border: 2px solid var(--primary-color);
            border-radius: 8px;
            transition: all 0.2s ease;
            text-decoration: none;
            margin-top: 2rem;
        }

        .btn-edit:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-1.5px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
        }

        .progress-bar {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 3px;
            background: var(--success-green);
            transition: width 0.8s ease;
        }

        .total-votes {
            text-align: center;
            color: #64748b;
            font-size: 0.9em;
            margin-top: 1.5rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 2rem;
                border-radius: 16px;
            }

            h1 {
                font-size: 1.75rem;
            }

            .option-btn {
                padding: 1.25rem;
                flex-direction: column;
                align-items: flex-start;
                gap: 0.75rem;
            }

            .vote-count {
                align-self: flex-end;
            }
        }
    </style>
    <script>
        // JavaScript to enable buttons when the Edit Vote button is clicked
        function enableVotingButtons() {
            const votingButtons = document.querySelectorAll('.option-btn');
            votingButtons.forEach(button => {
                button.disabled = false; // Enable all vote buttons
            });
            const editButton = document.querySelector('.btn-edit');
            editButton.style.display = 'none'; // Hide the Edit Vote button
        }
    </script>
</head>
<body>
<div class="container">
    <!-- Navigation -->
    <a href="/" class="btn-back">
        <i class="fas fa-arrow-left"></i>
        <span>Back to Polls</span>
    </a>

    <!-- Poll Content -->
    <h1>${poll.pollQuestion}</h1>

    <!-- Voting Interface -->
    <form action="/poll/${poll.pollId}/vote" method="post">
        <div class="options-container">
            <c:forEach items="${options}" var="option">
                <button type="submit"
                        name="optionId"
                        value="${option.optionId}"
                        class="option-btn"
                    ${userVote != null ? 'disabled' : ''}>
                    <span>${option.optionText}</span>
                    <span class="vote-count">
                        <i class="fas fa-chart-bar"></i>
                        ${option.voteCount}
                    </span>
                    <div class="progress-bar" style="width: ${(option.voteCount/totalVotes)*100}%"></div>
                </button>
            </c:forEach>
        </div>
    </form>

    <!-- Edit and Status -->
    <div class="text-center">
        <c:if test="${userVote != null}">
            <button class="btn-edit" onclick="enableVotingButtons()">Edit Vote</button>
        </c:if>
    </div>
</div>
</body>
</html>