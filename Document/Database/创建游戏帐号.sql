/*
����:
$loginPass ��Ϸ��ʹ�����ݿ��¼�˺�(game_user)������
*/
CREATE LOGIN [game_user] WITH PASSWORD=N'$(loginPass)', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
go