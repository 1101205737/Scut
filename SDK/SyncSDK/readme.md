SyncSDK
=================

SyncSDK ʹ��
----------------
<ul>
<li>����SyncSDKĿ¼����Ϸ��Ŀ��Client/luaĿ¼��
<li>��luaĿ¼�µ�mainapp.lua�ļ����޸�<br />
    a) ����ScutDataSync.lua�ļ���require("SyncSDK.ScutDataSync")
    b) ��table����strSubDirs����"SyncSDK"����Ŀ¼
    c) ע�������push�ص���CCDirector:sharedDirector():RegisterSocketPushHandler("ScutDataSync.PushReceiverCallback");
    d) �ļ���β����ע��Sync֪ͨ�����ص������磺ScutDataSync.registerSceneCallback(ScutEntityListener.NotifySceneLayer)
</ul>