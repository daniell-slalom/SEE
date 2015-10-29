using SEE.Api.Managers;
using SEE.Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SEE.Api.Controllers
{
    public class BeaconController : ApiController
    {
        // GET: api/Beacon
        public IEnumerable<UserLocation> Get()
        {
            var items = UserLocationsManager.Instance.GetRecords();
            return items;
        }

        // PUT: api/Beacon/5
        public void Post([FromBody]UserLocation userLocation)
        {
            UserLocationsManager.Instance.Log(userLocation);
        }
    }
}
