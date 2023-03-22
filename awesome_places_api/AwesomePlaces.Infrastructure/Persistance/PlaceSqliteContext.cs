using Microsoft.Data.Sqlite;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AwesomePlaces.Infrastructure.Persistance;
public class PlaceSqliteContext
{
    protected readonly IConfiguration _configuration;
    
    public PlaceSqliteContext(IConfiguration configuration)
    {
        _configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
    }

    public IDbConnection CreateConnection()
    {
        return new SqliteConnection(_configuration.GetConnectionString("Place"));
    }
}
