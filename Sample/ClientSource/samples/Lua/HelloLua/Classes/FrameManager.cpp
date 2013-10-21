#include "DataRequest.h"
#include "FrameManager.h"
#include "CCScheduler.h"
//#include "UpdateEngine.h"
#include "CCDirector.h"
//using namespace NdUpdate;
using namespace ScutDataLogic;

CFrameManager::CFrameManager( void )
{
	cocos2d::CCDirector::sharedDirector()->getScheduler()->scheduleUpdateForTarget(this, 0, false);
}

CFrameManager::~CFrameManager( void )
{
	cocos2d::CCDirector::sharedDirector()->getScheduler()->unscheduleUpdateForTarget(this);
}

void CFrameManager::update( float dt )
{
	//ִ���������ݴ���
	CDataRequest::Instance()->PeekLUAData();
	//ִ�в����ش���
	//CUpdateEngine::getInstance()->tick(dt);	
}

CFrameManager* CFrameManager::Instance()
{
	static CFrameManager g_Instance;
	return &g_Instance;
}

