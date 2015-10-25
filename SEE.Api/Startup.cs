using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SEE.Api.Startup))]
namespace SEE.Api
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
