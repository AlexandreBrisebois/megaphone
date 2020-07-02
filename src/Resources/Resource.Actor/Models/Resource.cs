using Resource.Actor.Interface.Models;
using System;
using System.Text.Json.Serialization;

namespace Resource.Actor.Models
{
    public class Resource
    {
        [JsonPropertyName("id")]
        public string Id { get; set; }
        [JsonPropertyName("display")]
        public string Display { get; set; }
        [JsonPropertyName("statusCode")]
        public int StatusCode { get; set; }
        [JsonPropertyName("created")]
        public DateTimeOffset Created { get; set; } = DateTimeOffset.UtcNow;
        [JsonPropertyName("isActive")]
        public bool IsActive { get; set; }
        [JsonPropertyName("type")]
        public string Type { get; set; }
        [JsonPropertyName("description")]
        public string Description { get; set; }
        [JsonPropertyName("self")]
        public Uri Self { get; set; }
        [JsonPropertyName("published")]
        public DateTimeOffset Published { get; set; }
    }
}
