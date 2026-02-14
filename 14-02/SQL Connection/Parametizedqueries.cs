using System;
using Microsoft.Data.SqlClient;
namespace sql{
class Program3
{
    static void Main(string[] args)
    {
        
         string cs = @"Server=localhost\SQLEXPRESS;Database=TrainingDB;Trusted_Connection=True;TrustServerCertificate=True;";
        Console.Write("Enter Department (e.g., IT): ");
        string dept = Console.ReadLine() ?? "";

        string sql = @"SELECT EmployeeId, FullName, Salary
                       FROM dbo.Employees
                       WHERE Department = @dept
                       ORDER BY Salary DESC";

        using (var con = new SqlConnection(cs))
        using (var cmd = new SqlCommand(sql, con))
        {
            // Add parameter
            cmd.Parameters.AddWithValue("@dept", dept);

            con.Open();

            using (var r = cmd.ExecuteReader())
            {
                while (r.Read())
                {
                    Console.WriteLine($"{r["EmployeeId"]} | {r["FullName"]} | {r["Salary"]}");
                }
            }
        }

        Console.WriteLine("\nPress any key to exit...");
        Console.ReadKey();
    }
}
}