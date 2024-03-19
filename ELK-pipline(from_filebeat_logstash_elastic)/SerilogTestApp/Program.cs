using Serilog;
using Serilog.Events;
using Serilog.Sinks.File;
namespace  SerilogTestApp
{
    public class Program
    {

        public static void Main(string[] args)
        {
            
            // configure Serilog
            Log.Logger = new LoggerConfiguration()
                .MinimumLevel.Debug()
                .MinimumLevel.Override("Microsoft", LogEventLevel.Information)
                .Enrich.FromLogContext()
                .WriteTo.Console()
                .WriteTo.File("./../logs/logs.log")
                .CreateLogger();

            try
            {
                
                
                
                Log.Information("Starting app ...");
                
                int x=5;
                int y=8;
                var z= (x+y)/(x-5);
                //CreateHostBuilder(args).Build().Run();
            }
            catch(Exception ex){
                Log.Fatal(ex,"Application Terminate Unexpected");
            }
            finally
            {
                Log.Information("Finishing app ...");
                Log.CloseAndFlush();
            }

        }
    }
    
}