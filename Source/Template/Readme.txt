ʵ���ʹ��ģ���Զ�����

Codesmith ��������ʶ���Զ�������: �� Enum<CountryType> or CacheList<Infor> or Infor

1.����ö���ֶ�����
EXECUTE sp_addextendedproperty N'MS_Description', '����[Enum<CountryType>]', N'SCHEMA', N'dbo', N'table', N'����', N'column', N'�ֶ���' 

2.���Ӷ����ֶ�����
EXECUTE sp_addextendedproperty N'MS_Description', '����[CacheList<T>]', N'SCHEMA', N'dbo', N'table', N'����', N'column', N'�ֶ���' 

3.���ӱ�ע��
EXECUTE sp_addextendedproperty N'MS_Description', '�����Ϣ[:BaseUser]', N'user', N'dbo', N'table', N'GameUser', NULL, NULL

