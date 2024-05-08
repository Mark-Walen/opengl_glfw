@echo off

REM Check if the clean argument is provided
if /I "%~1"=="clean" (
    REM Check if the build directory exists
    if exist build (
        echo Cleaning build directory...
        REM Delete the build directory
        rd /s /q build
    ) else (
        echo There is no build directory to clean, existing!
    )
    exit /b
)

REM Check if the required argument is provided
if "%~1"=="" (
    echo Usage: %~nx0 src_dir
    exit /b 1
)

REM Store the source directory argument
set "src_dir=%~1"

REM You can perform further processing using the src_dir variable
echo Source directory: %src_dir%

cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DGLFW_USE_DLL=ON -DGLFW_LIB=lib-mingw-w64 -S./%src_dir% -B./build -G "MinGW Makefiles

cd .\build\
mingw32-make
