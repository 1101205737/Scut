SyncSDK
=================

SyncSDK ʹ��
----------------
> 1.����SyncSDKĿ¼����Ϸ��Ŀ��Client/luaĿ¼�£�
> 2.��luaĿ¼�µ�mainapp.lua�ļ����޸�
<ul>
    <li>����ScutDataSync.lua�ļ���require("SyncSDK.ScutDataSync")
    <li>��table����strSubDirs����"SyncSDK"����Ŀ¼
    <li>ע�������push�ص���CCDirector:sharedDirector():RegisterSocketPushHandler("ScutDataSync.PushReceiverCallback");
    <li>�ļ���β����ע��Sync֪ͨ�����ص������磺ScutDataSync.registerSceneCallback(ScutEntityListener.NotifySceneLayer)
</ul>