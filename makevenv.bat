@echo off
SETLOCAL ENABLEEXTENSIONS

SET VENV_DIR=.venv

echo Creating virtual environment: %VENV_DIR%
python -m venv %VENV_DIR%

IF EXIST "%VENV_DIR%\Scripts\activate.bat" (
    echo Virtual environment created successfully.
) ELSE (
    echo Failed to create the virtual environment.
    EXIT /B 1
)

CALL %VENV_DIR%\Scripts\activate.bat

IF "%1"=="-i" (
    IF EXIST requirements.txt (
        echo Installing dependencies from requirements.txt...
        pip install -r requirements.txt
    ) ELSE (
        echo requirements.txt not found.
    )
)

cmd /K
