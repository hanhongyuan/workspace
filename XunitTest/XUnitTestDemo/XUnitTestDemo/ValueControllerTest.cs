using System;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using Newtonsoft.Json;
using Xunit;
using WebApiDemo;

namespace XUnitTestDemo
{
    public class ValueControllerTest
    {
        [Fact]
        public void GetValuesTest()
        {
            var client = new TestServer(WebHost
                    .CreateDefaultBuilder()
                    .UseStartup<Startup>())
                .CreateClient();
            string result = client.GetStringAsync("api/values").Result;
            Assert.Equal(result, JsonConvert.SerializeObject(new string[] { "value1", "value2" }));
        }
    }
}
