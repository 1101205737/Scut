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

    ScutScene = {}

    function ScutScene:new(o)
        o = o or {}
        if o.root == nil then
            o.root = CCScene:create()
        end
        setmetatable(o, self)
        self.__index = self
        return o
    end

    function ScutScene:registerScriptHandler(func)
    end

    function ScutScene:registerCallback()
    end

    function ScutScene:registerNetErrorFunc()
    end

    function ScutScene:registerNetCommonDataFunc()
    end

    function ScutScene:registerNetDecodeEnd()
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
        ZyLoading.hide(pScutScene, nTag)
    end
    --ע�������push�ص�
    CCDirector:sharedDirector():RegisterSocketPushHandler("PushReceiverLayer.PushReceiverCallback");
    --NDFixSDK.FixCocos2dx:CreateFixCocos2dx():RegisterSocketPushHandler("PushReceiverLayer.PushReceiverCallback")
    --ScutScene:registerNetCommonDataFunc("processCommonData");
    ScutScene:registerNetErrorFunc("LoginScene.netConnectError2");
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
    require("config")
    require("framework.init")
    require("FrameManager")
    g_frame_mgr = FrameManager:new()
    g_frame_mgr:init()
    ScutMain()
    testScene.init()
end

xpcall(main, __G__TRACKBACK__)