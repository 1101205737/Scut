namespace ZyGames.Framework.RPC.Web
{
    /// <summary>
    /// 
    /// </summary>
    public class HttpSettings
    {
        /// <summary>
        /// 
        /// </summary>
        public HttpSettings()
        {
            HostAddress = "http://127.0.0.1";
            Port = 80;
            RequestTimeout = 120 * 1000;
        }

        /// <summary>
        /// IP������
        /// </summary>
        public string HostAddress { get; set; }

        /// <summary>
        /// �˿�
        /// </summary>
        public int Port { get; set; }

        /// <summary>
        /// ��Ϸ������
        /// </summary>
        public string GameAppName { get; set; }

        /// <summary>
        /// ����ʱ�����룩
        /// </summary>
        public int RequestTimeout { get; set; }
    }
}