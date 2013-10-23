#ifndef SCENEMANAGER_H
#define SCENEMANAGER_H
//���ڹ��� ScutScene
#include <map>

#include "Stream.h"
#include "ScutScene.h"

namespace ScutCxControl
{
	
	//���������࣬ScutScene�����������ʱ���Զ����뵽CSceneManager������ֶ�����
	class CSceneManager
	{
	public:
		~CSceneManager(void);
		static CSceneManager* getInstance();
		void push(ScutScene* pScene);
		void earse(ScutScene* pScene);
		bool find(ScutScene* pScene);
	private:
		static CSceneManager* instance;
		CSceneManager(void);
		std::map<ScutScene*, int> m_mapScutScene;
	};
	
	//����
	void netDataDispatch(void *pScene, int nTag, int nNet, ScutSystem::CStream* lpData, void* lpExternal);

}


#endif//SCENEMANAGER_H