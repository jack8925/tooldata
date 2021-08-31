@ECHO OFF
cd /d "%~dp0"&&fltmc>nul||mshta vbscript:CreateObject("Shell.Application").ShellExecute("%~s0","","","runas",1)(window.close)&&exit
SET extension=".jpg" ".png" ".gif"

FOR %%a IN (%extension%) DO ( 
	REG query "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v %%a
	IF ERRORLEVEL == 1 reg add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v %%a /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
)
cls
ECHO done
pause