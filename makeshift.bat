@echo off
setlocal enabledelayedexpansion

REM Makeshiftfile - A Makefile, but it's makeshift (Windows Edition)
REM This Batch script compiles every source file in the CWD and runs them one at a time.
REM Bash script coming soon.

REM == Configuration
set compiler=g++
set compile_flags=-O3 -Wall
set execute_cmd=call
set file_type=cpp
set require_confirmation=1

REM == Debug info
echo We're in %cd%.
echo We're compiling %file_type% files.
echo We're using the compiler "%compiler%" with flags "%compile_flags%".
echo We're running "%execute_cmd%" on every .exe in %cd%.
if !require_confirmation! EQU 1 (
    echo We'll ask for confirmation before running executables.
) else (
    echo We'll just run everything without asking.
)

REM == Functionality
for %%F in (*.%file_type%) do (
    set source_file=%%F
    set base_name=%%~nF
    echo Compiling "!source_file!"...
    !compiler! "!source_file!" %compile_flags% -o "!base_name!.exe"
    if !errorlevel! neq 0 (
        echo Compilation failed for "!source_file!"
    ) else (
        echo Compilation successful for "!source_file!"
    )
)

if !require_confirmation! EQU 1 (
    set /p confirm=We're now ready to run all the executables. Press enter to continue.
)

for %%F in (*.exe) do (
    if /I "%%~xF" EQU ".exe" (
        echo Running "%%F"...
        %execute_cmd% "%%F"
    )
    if !require_confirmation! EQU 1 (
        set /p confirm=Finished running "%%F". Press enter to continue.
    )
)

endlocal

REM Batch scripting is fricking confusing.
