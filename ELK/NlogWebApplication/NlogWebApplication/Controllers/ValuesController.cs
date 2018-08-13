using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NLog;

namespace NlogWebApplication.Controllers
{
    [Route("api/[controller]")]
    public class ValuesController : Controller
    {
        private readonly ILogger logger = LogManager.GetCurrentClassLogger();
        // GET api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            logger.Info(@"{""App"":""NlogWebApplication"",""Controller"":""ValuesController"", ""Mthod"":""Get"",""objId"":"+id+"}");
            logger.Warn(@"{""App"":""NlogWebApplication"",""Controller"":""ValuesController"", ""Mthod"":""Get"",""objId"":" + id + "}");
            logger.Debug(@"{""App"":""NlogWebApplication"",""Controller"":""ValuesController"", ""Mthod"":""Get"",""objId"":" + id + "}");
            return "value" + id;
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
