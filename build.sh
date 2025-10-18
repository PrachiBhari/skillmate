#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -o errexit

# 1. Install dependencies
pip install -r requirements.txt

# 2. Collect static files (CSS/JS/Images)
python manage.py collectstatic --no-input

# 3. Apply database migrations to the PostgreSQL DB
python manage.py migrate


    # 4. TEMPORARY: Create Superuser using environment variables
    # These environment variables (SUPERUSER_USERNAME, etc.) MUST be set on Render
    # This command is idempotent (safe to run multiple times)
    echo "Attempting to create superuser..."
    python manage.py createsuperuser --noinput || true
    echo "Superuser command executed."
    