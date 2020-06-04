﻿using Microsoft.AspNetCore.Mvc;

namespace List.API.Controllers
{
    namespace Crawler.API.Controllers
    {
        [ApiController]
        [Route("[controller]")]
        public class DaprController : ControllerBase
        {
            [HttpGet("subscribe")]
            public IActionResult GetTask()
            {
                return Ok(new[]
                { "crawl"
                // new {
                //     Topic = "order",
                //     Route = "/order"
                // }
                });
            }
        }
    }
}
