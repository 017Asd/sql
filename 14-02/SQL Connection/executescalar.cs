using Microsoft.Data.SqlClient;

string cs = @"Server=localhost\SQLEXPRESS;Database=TrainingDB;Trusted_Connection=True;TrustServerCertificate=True;";
string sql = "SELECT COUNT(*) FROM dbo.Employees";

using var con = new SqlConnection(cs);
using var cmd = new SqlCommand(sql, con);

con.Open();
object result = cmd.ExecuteScalar();  // returns object
int total = Convert.ToInt32(result);

Console.WriteLine($"Total employees: {total}");