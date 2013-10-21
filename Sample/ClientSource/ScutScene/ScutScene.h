#ifndef ScutSCENE_H
#define ScutSCENE_H
#include "CCScene.h"
#include "Stream.h"
namespace ScutCxControl
{
	class ScutScene:public cocos2d::CCScene
	{
	public:
		ScutScene(void);
		virtual ~ScutScene(void);
		bool init();
		static ScutScene* node(void);
		//lua func (int nTag, void * pUserData, const char* pszNetData, int nNetDataSize);
		void registerCallback(const char* pszCallback);
		//ִ�и��ೡ���Ļص����������������ݵķַ�����netDataDispatch(void *pScene, int nTag, int nNet, ScutSystem::CStream* lpData, void* lpExternal)����
		void execCallback( int nTag, int nNetState, ScutSystem::CStream* lpData, void* lpExternal);
		void onExit();
		void onEnter();
		//ע���˳�������LUA�ص��������ص�����ԭ�ͣ�(*pszCallback)(ScutScene* pScutScene);
		void registerOnExit(int pszFunc);
		//ע����볡����LUA�ص��������ص�����ԭ�ͣ�(*pszCallback)(ScutScene* pScutScene);
		void registerOnEnter(int pszFunc);

		//ע������������LUA�ص��������ص�����ԭ�ͣ�(*pszCallback)(ScutScene* pScutScene, int tag);
		static void registerNetErrorFunc(const char* pszCallback);
		//ע���������ݹ�������ͷ�����LUA�ص��������ص�����ԭ�ͣ�(*pszCallback)(ScutScene* pScutScene); 
		static void registerNetCommonDataFunc(const char* pszCallback);//����ÿ��Э�鹫�ε��ֶ�

		//ע���������ݴ��������LUA�Ļص��������ص�����ԭ�ͣ�(*pszCallback)(ScutScene* pScutScene, int tag);
		static void registerNetDecodeEnd(const char* pszCallback);
	private:
		int m_nEnter;
		int m_nExit;
		std::string m_strCallback;
		static std::string s_strNetErrorFunc;
		static std::string s_strNetCommonFunc;
		static std::string s_strNetDecodeend;
	};



}

#include "tolua_fix.h"
using namespace ScutCxControl;
typedef int LUA_FUNCTION;

#endif//ScutSCENE_H