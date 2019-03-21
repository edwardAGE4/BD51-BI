@echo off
echo EXECUTING Package1
"C:\Program Files (x86)\Microsoft SQL Server\130\DTS\Binn\DTExec.exe" /f "E:\scripts\Integration Services BD51 Project\Package1.dtsx" > E:\logs\exec_package1.log
echo Done. You can check the logs file
echo.
pause