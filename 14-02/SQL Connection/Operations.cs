using Microsoft.Data.SqlClient;
using System;
namespace sql{
class Program2
{
    static void Main()
    {
            string cs = @"Server=localhost\SQLEXPRESS;Database=TrainingDB;Trusted_Connection=True;TrustServerCertificate=True;";


        using (var con = new SqlConnection(cs))
        {
            con.Open();

            string insertSql = "INSERT INTO dbo.Employees (FullName, Department, Salary) VALUES (@name, @dept, @salary)";

            using (var insertCmd = new SqlCommand(insertSql, con))
            {
                // insertCmd.Parameters.AddWithValue("@name", "Anuska Palit");
                // insertCmd.Parameters.AddWithValue("@dept", "IT");
                // insertCmd.Parameters.AddWithValue("@salary", 75000);
                // insertCmd.Parameters.AddWithValue("@name", "Sachin k");
                // insertCmd.Parameters.AddWithValue("@dept", "Msc");
                // insertCmd.Parameters.AddWithValue("@salary", 75);
                 insertCmd.Parameters.AddWithValue("@name", "Devi ");
                insertCmd.Parameters.AddWithValue("@dept", "Mtech");
                insertCmd.Parameters.AddWithValue("@salary",500 );

                int rows = insertCmd.ExecuteNonQuery();
            }

        
            string selectSql = "SELECT EmployeeId, FullName, Department, Salary FROM dbo.Employees ORDER BY EmployeeId";

            using (var selectCmd = new SqlCommand(selectSql, con))
            using (var reader = selectCmd.ExecuteReader())
            {
                Console.WriteLine("Employee List:\n");

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);
                    string name = reader.GetString(1);
                    string dept = reader.GetString(2);
                    decimal salary = reader.GetDecimal(3);

                    Console.WriteLine($"{id} | {name} | {dept} | {salary}");
                }
            }
            con.Close();
        }
    }
}
}