@echo off

if "%1" == "" (
@echo ����:
@echo     ִ������ȱ��"[dbServer]"����
goto error
)
if "%2" == "" (
@echo ����:
@echo     ִ������ȱ��"[dbAcount]"����
goto error
)
if "%3" == "" (
@echo ����:
@echo     ִ������ȱ��"[dbPass]"����
goto error
)
if "%4" == "" (
@echo ����:
@echo     ִ������ȱ��"[gamepass]"����
goto error
)
if "%5" == "" (
@echo ����:
@echo     ִ������ȱ��"[dbpath]"����
goto error
) else (

@echo ���ڴ������ݿ��¼�ʺ�...
Sqlcmd -S %1 -U %2 -P %3 -d master -i ������Ϸ�ʺ�.sql -v loginPass="%4"

@echo ���ڴ����û��������ݿ�...
Sqlcmd -S %1 -U %2 -P %3 -d master -i �û����ı�ṹ.sql -v dbpath="%5" 

@echo ���ڴ����ַ����ֵ�������ݿ�...
Sqlcmd -S %1 -U %2 -P %3 -d master -i �ַ����ֵ���ı�ṹ.sql -v dbpath="%5" 

goto success
)

:error
@echo ���������
@echo     [dbServer] ���ݿ������
@echo     [dbAcount] ���ݿ��¼�ʺ� 
@echo     [dbPass] ���ݿ��¼���� 
@echo     [gamepass] ��Ϸ��¼�ʺ�game_user������ 
@echo     [dbpath] ���ݿ�洢·�� 

:success
@echo ִ�гɹ�

ECHO ���н�����& PAUSE
