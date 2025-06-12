using System.Data;
using TopStoryServerV1.Data;
using TopStoryServerV1.Interfaces;
using TopStoryServerV1.Repositories;
using TopStoryServerV1.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddHttpClient();

// Add CORS
builder.Services.AddCors(options =>
{
	options.AddPolicy("AllowWebApp", policy =>
	{
		policy.WithOrigins("http://localhost:3000")
			  .AllowAnyMethod()
			  .AllowAnyHeader();
	});
});

builder.Services.AddSingleton<DbContext>();

builder.Services.AddScoped<IDbConnection>(provider =>
{
	var factory = provider.GetRequiredService<DbContext>();
	return factory.CreateConnection();
});

builder.Services.AddScoped<IArticleRepository, ArticleRepository>();
builder.Services.AddScoped<INYTimesApiRepository, NYTimesApiRepository>();

// Add service dependencies
builder.Services.AddScoped<IArticleService, ArticleService>();

builder.Services.AddLogging(config =>
{
	config.AddConsole();
	config.AddDebug();
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors("AllowWebApp");

app.UseAuthorization();

app.MapControllers();

app.Run();
