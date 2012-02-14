//  Developer: Cory Fowler
// 

namespace NerdDinner.Helpers
{
    using System.Configuration;
    using Microsoft.WindowsAzure.ServiceRuntime;

    /// <summary>
    /// Provides a way of Providing Context between Cloud and On-Premise Deployment of an Application.
    /// </summary>
    public class ConnectionStringResolver
    {
        private string _connectionString;
        private string _cloudConnectionString;
        private string _localConnectionString;

        public string ConnectionString
        {
            get
            {
                if (string.IsNullOrWhiteSpace(_connectionString))
                {
#if AZURE

                    _connectionString = RoleEnvironment.GetConfigurationSettingValue(_cloudConnectionString);

#else
                    _connectionString = ConfigurationManager.ConnectionStrings[_localConnectionString].ConnectionString;
#endif
                }
                return _connectionString;
            }
        }

        public static ConnectionStringResolver Create()
        {
            return new ConnectionStringResolver();
        }

        public ConnectionStringResolver WithCloudConnectionStringName(string settingName)
        {
            _cloudConnectionString = settingName;
            return this;
        }

        public ConnectionStringResolver WithLocalConnectionStringName(string settingName)
        {
            _localConnectionString = settingName;
            return this;
        }
    }
}