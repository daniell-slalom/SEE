using Microsoft.AspNet.Mvc;
using SEE.Api.Managers;
using SEE.Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SEE.Api.Controllers
{
    [Route("api/[controller]")]
    public class BeaconController: Controller
    {
        [HttpGet]
        public IEnumerable<UserLocation> Get()
        {
            var results = UserLocationsManager.Instance.GetRecords();
            return results;
        }

        [HttpPost]
        public void Post([FromBody]UserLocation userLocation)
        {
            UserLocationsManager.Instance.Log(userLocation);
        }

    }
}
