@echo off
xcopy /y ZyGames.Framework.Game\bin\Release\ZyGames.Framework.Game.* ..\..\Release\6.7.9.7\Lib\ /EXCLUDE:copyfilter.txt
xcopy /y ScutSecurity\bin\Release\*.dll ..\..\Release\6.7.9.7\Lib\ /EXCLUDE:copyfilter.txt

xcopy /y GameServer\bin\Release\GameServer.* ..\..\Release\6.7.9.7\Console\ /EXCLUDE:copyfilter.txt
xcopy /y GameServer\bin\Release\NLog.config ..\..\Release\6.7.9.7\Console\
xcopy /y /s GameServer\Script\*.* ..\..\Release\6.7.9.7\Console\Script\

ECHO ������ϣ�& PAUSE