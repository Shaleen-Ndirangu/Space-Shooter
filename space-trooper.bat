@echo off

:: Check for administrator privileges
NET SESSION >nul 2>&1
if %errorLevel% == 0 (
    echo Administrator privileges detected. Running with elevated permissions.
) else (
    echo Requesting administrator privileges...
    goto UACPrompt
)

:: Change directory to the script's directory
cd /d %~dp0


:: Check if there is an environment already present, if there is one skip the command,else Create a virtual environment
if exist env (
    echo Virtual environment already exists. Skipping creation.
    venv\Scripts\activate
) else (
    echo Creating virtual environment...
    python -m venv env
    venv\Scripts\activate
    pip install -r requirements.txt
) 
:: Run the Python script
python "main.py"

:: Deactivate the virtual environment
deactivate

