using System.Threading.Tasks;
using Crawler.Models;
using HtmlAgilityPack;
using Standard.Commands;

namespace Crawler.Command
{
    internal class LoadPageDetails : ICommand<Resource>
    {
        private readonly string content;

        public LoadPageDetails(string content)
        {
            this.content = content;
        }

        public async Task ApplyAsync(Resource model)
        {
            model.Type = ResourceType.Page;

            var document = new HtmlDocument();
            document.LoadHtml(content);
            var title = document.DocumentNode.SelectSingleNode("//html/head/title");
            model.Display = title.InnerText;

            await Task.CompletedTask;
        }
    }
}