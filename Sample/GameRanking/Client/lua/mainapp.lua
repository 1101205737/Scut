------------------------------------------------------------------
-- mainapp.lua
-- Author     : Xin Zhang
-- Version    : 1.0.0.0
-- Date       : 2011-10-15
-- Description:
------------------------------------------------------------------


local strModuleName = "mainapp"
CCLuaLog("Module ".. strModuleName.. " loaded.")
strModuleName = nil

local function ScutMain()
    ---[[
    ------------------------------------------------------------------
    -- ���� ��ʼ���������� ��ʼ ����
    ------------------------------------------------------------------
    
    local strRootDir = ScutDataLogic.CFileHelper:getPath("lua");
    local strTmpPkgPath = package.path;
    
    local strSubDirs =
    {
        "scenes",
        "layers",
        "datapool",
        "config",
        "action",
        "lib",
        "commupdate",
        "payment",
        
        -- �ڴ�����µ�Ŀ¼
    };
    
    --package.path = string.format("%s/?.lua;%s/lib/?.lua;%s/action/?.lua;%s/common/?.lua;%s/datapool/?.lua;%s/Global/?.lua;%s/layers/?.lua;%s/LuaClass/?.lua;%s/scenes/?.lua;%s/titleMap/?.lua;%s",strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir, strTmpPkgPath);
    
    -- ���������ļ���
    for key, value in ipairs(strSubDirs) do
        local strOld = strTmpPkgPath;
        if(1 == key) then
            strTmpPkgPath = string.format("%s/%s/?.lua%s", strRootDir, value, strOld);
        else
            strTmpPkgPath = string.format("%s/%s/?.lua;%s", strRootDir, value, strOld);
        end
    --  CCLuaLog(value.. " added.");
        strOld = nil;
    end
    
    package.path = string.format("%s/?.lua;%s", strRootDir, strTmpPkgPath);
    strTmpPkgPath = nil;
    
    
    ------------------------------------------------------------------
    -- ���� ��ʼ���������� ���� ����
    ------------------------------------------------------------------
    
    -- require�����ڻ���������ʼ��֮�󣬱����ļ��Ҳ������������
    require("lib.lib")
    require("datapool.Image")
    require("testScene")
    require("datapool.PushReceiverLayer")

    function OnHandleData(pScene, nTag, nNetRet, pData, size)
        pScene = tolua.cast(pScene, "CCScene")
        scenes[pScene]:execCallback(nTag, nNetRet, pData)
    end

    ScutScene = {}

    scenes = {}
    function ScutScene:new(o)
        o = o or {}
        if o.root == nil then
            o.root = CCScene:create()
            print(o.root)
        end
        setmetatable(o, self)
        self.__index = self
        scenes[o.root] = o
        return o
    end

    function ScutScene:registerScriptHandler(func)
    end

    function ScutScene:registerCallback(func)
        func = func or function()end
        self.mCallbackFunc = func
    end

    function ScutScene:registerNetErrorFunc(func)
        func = func or function()end
        self.mNetErrorFunc = func
    end

    function ScutScene:registerNetCommonDataFunc(func)
        func = func or function()end
        self.mNetCommonDataFunc = func
    end

    function ScutScene:registerNetDecodeEnd()
        func = func or function()end
        self.NetDecodeEndFunc = func
    end

    function ScutScene:execCallback(nTag, nNetState, pData)
        if 2 == nNetState then
            local reader = ScutDataLogic.CDataRequest:Instance()
            local bValue = reader:LuaHandlePushDataWithInt(pData)
            if not bValue then return end
            if self.mCallbackFunc then
                self.mCallbackFunc(self.root)
            end

            if self.mNetCommonDataFunc then
                self.mNetCommonDataFunc()
            end

            netDecodeEnd(self.root, nTag)

            if self.mNetErrorFunc then
                self.mNetErrorFunc()
            end
        end
    end

    math.randomseed(os.time());
    __NETWORK__=true
    ------------------------------------------------------------------
    -- ���� Э���������ע�� ��ʼ ����
    ------------------------------------------------------------------
    
    function processCommonData(lpScene)
    return true;
    end
    
    function netDecodeEnd(pScutScene, nTag)
--        ZyLoading.hide(pScutScene, nTag)
    end
    --ע�������push�ص�
    CCDirector:sharedDirector():RegisterSocketPushHandler("PushReceiverLayer.PushReceiverCallback")
    --NDFixSDK.FixCocos2dx:CreateFixCocos2dx():RegisterSocketPushHandler("PushReceiverLayer.PushReceiverCallback")
    --ScutScene:registerNetCommonDataFunc("processCommonData");
    --ScutScene:registerNetErrorFunc("LoginScene.netConnectError2")
    ScutScene:registerNetDecodeEnd("netDecodeEnd");
    --NdUpdate.CUpdateEngine:getInstance():registerResPackageUpdateLuaHandleFunc("CommandDataResove.resourceUpdated")
    
    CCDirector:sharedDirector():RegisterBackHandler("MainScene.closeApp")
    --ע��crash log�ص�
    CCDirector:sharedDirector():RegisterErrorHandler("err_handler")
    
    --
    function err_handler(str)
        ZyRequestCounter = ZyRequestCounter + 1
        ZyWriter:writeString("ActionId",404 );
        ZyWriter:writeString("ErrorInfo", str)
        ZyExecRequest(ScutScene, nil,isLoading)
    --  ScutDataLogic.CDataRequest:Instance():AsyncExecRequest(ScutScene, ZyWriter:generatePostData(), ZyRequestCounter, nil);
    --  ScutDataLogic.CNetWriter:resetData()
    end
    
    ------------------------------------------------------------------
    -- ���� Э���������ע�� ���� ����
    ------------------------------------------------------------------
    ---]]
end
-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local function main()
    require("FrameManager")
    g_frame_mgr = FrameManager:new()
    g_frame_mgr:init()
    ScutMain()
    testScene.init()
end

xpcall(main, __G__TRACKBACK__)