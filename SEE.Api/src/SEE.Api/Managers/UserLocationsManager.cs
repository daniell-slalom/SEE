using SEE.Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SEE.Api.Managers
{
    public class UserLocationsManager
    {
        public static UserLocationsManager Instance = new UserLocationsManager();

        public Dictionary<string, UserLocation> UserLocationRecords = new Dictionary<string, UserLocation>();
        private UserLocationsManager()
        {

        }

        public void Log(UserLocation userLocation)
        {
            if (UserLocationRecords.ContainsKey(userLocation.username))
            {
                UserLocationRecords[userLocation.username] = userLocation;
            }
            else
            {
                UserLocationRecords.Add(userLocation.username, userLocation);
            }
        }

        public IEnumerable<UserLocation> GetRecords()
        {
            var items = this.UserLocationRecords.Select(r => r.Value).ToList();
            return items;
        }
    }
}
