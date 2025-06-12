﻿using Microsoft.Data.SqlClient;
using System.Data;

namespace TopStoryServerV1.Data
{
	public class DbContext
	{
		private readonly IConfiguration _configuration;

		public DbContext(IConfiguration configuration)
		{
			_configuration = configuration;
		}

		public IDbConnection CreateConnection()
		{
			return new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
		}
	}
}
