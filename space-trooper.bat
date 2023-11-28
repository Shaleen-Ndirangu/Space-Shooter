@echo off

:: Check for administrator privileges
NET SESSION >nul 2>&1
if %errorLevel% == 0 (
    echo Administrator privileges detected. Running with elevated permissions.
) else (
    echo Please run this script as an administrator.
    pause
    exit /b
)

:: Replace 'env' with the name of your virtual environment
python -m venv env

:: Replace 'env' with the name of your virtual environment
env\Scripts\activate

:: Replace 'requirements.txt' with the name of your requirements file
pip install -r requirements.txt

:: Replace 'your_script.py' with the name of your Python file
python main.py

:: Deactivate the virtual environment
deactivate 