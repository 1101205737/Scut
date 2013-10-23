#pragma once
#ifndef __ND_FRAMEMANAGER_H__
#define __ND_FRAMEMANAGER_H__

#include "CCObject.h"

using namespace cocos2d;

class CFrameManager: public CCObject
{
public:
	CFrameManager(void);
	virtual ~CFrameManager(void);
public:
	static CFrameManager* Instance();
protected:
	//����ʱ���ô˺�������ַ���������
	virtual void update(float dt);
};

#endif
