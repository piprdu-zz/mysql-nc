using NUnit.Framework;
using MySql.Data.MySqlClient;

namespace test_mysql_nc
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        [TestCase("server=localhost;database=mysql;user=root;password=example")]
        public void TestDbConnection(string stringConnection)
        {
            bool retorno = false;
            MySqlConnection conexion = new MySqlConnection(stringConnection);

            conexion.Open();

            retorno = true;

            conexion.Close();

            Assert.AreEqual(true, retorno);
        }
    }
}