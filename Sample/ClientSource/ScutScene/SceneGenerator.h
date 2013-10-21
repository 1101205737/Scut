#pragma once
#include "base_nodes/CCNode.h"
#include "layers_scenes_transitions_nodes/CCLayer.h"
#include "label_nodes/CCLabelTTF.h"
#include "menu_nodes/CCMenu.h"
#include "menu_nodes/CCMenuItem.h"
#include "sprite_nodes/CCSprite.h"
#include "tinyxml.h"

USING_NS_CC;

namespace NdCxControl
{
	class NdScene;	
	class CNdEdit;
	class NdLayer;
	class NdMenu;
	class NdCxListItem;
	class NdCxList;
	class CNdButton;
	class CSceneGenerator
	{
	private:
		CSceneGenerator(void);
		virtual ~CSceneGenerator(void);
	public:
		static CSceneGenerator* Instance();

		//��ȡָ�����Ƶĳ���
		NdScene* AcquireScene(const char* lpszSceneName);

		//����ָ���ĸ��ڵ㣬�������ƻ�ȡ��Ӧ�Ķ��ӽڵ����
		CCNode* GetChildByName(CCNode* pParent, const char* lpszChildName);

	protected:
		bool LoadScene(NdScene* pDest, const char* lpszSceneName);

		//���س��������ӽڵ�
		bool LoadLayer(NdTiXmlElement* markupXml, CCNode* pParentNode);
		bool LoadChildNode(NdTiXmlElement* markupXml, CCNode* pParentNode);

		//�����ڵ㲢��ӵ����ڵ�
		CCNode* CreateNodeAddToParent(NdTiXmlElement* markupXml, const char* pszType, CCNode* pParentNode);
		void DoActionAfterAddToParent(NdTiXmlElement* markupXml, const char* pszType, CCNode* pNode, CCNode* pParentNode = NULL);
		//����Cocos2d����
		//�����ڵ�
		CCNode* CreateNodeByProperty(NdTiXmlElement* markupXml, CCNode* pParentNode);

		//����layer
		CCLayer* CreateLayerByProperty(NdTiXmlElement* markupXml, CCNode* pNode = NULL);
		NdLayer* CreateNdLayerByProperty(NdTiXmlElement* markupXml);

		//�����б�
		NdCxList* CreateNdCxListByProperty(NdTiXmlElement* markupXml, CCNode* pNode = NULL);
		NdCxListItem* CreateNdCxListItemByProperty(NdTiXmlElement* markupXml, CCNode* pNode = NULL);

		//����label
		CCLabelTTF* CreateLabelTTFByProperty(NdTiXmlElement* markupXml);

		//��������
		CCSprite* CreateSpriteByProperty(NdTiXmlElement* markupXml);

		//�����˵�
		CCMenu* CreateMenuByProperty(NdTiXmlElement* markupXml, CCNode* pNode = NULL);
		NdMenu* CreateNdMenuByProperty(NdTiXmlElement* markupXml);

		//�����˵���
		CCMenuItem* CreateMenuItemByProperty(NdTiXmlElement* markupXml, CCNode* pNode = NULL);
		CCMenuItemLabel* CreateMenuItemLabelByProperty(NdTiXmlElement* markupXml);
		CCMenuItemSprite* CreateMenuItemSpriteByProperty(NdTiXmlElement* markupXml);

		//�����༭��
		CNdEdit*  CreateNdEditor(NdTiXmlElement* markupXml);

		//������ť
		CNdButton* CreateNdButtonByProperty(NdTiXmlElement* markupXml, CCNode* pNode = NULL);
	private:
		int HashString(const char* lpszValue);
	};
}