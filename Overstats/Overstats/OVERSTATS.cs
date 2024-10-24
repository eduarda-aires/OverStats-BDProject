using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace Overstats
{
    public partial class OVERSTATS : Form
    {
        private SqlConnection cn;

        public OVERSTATS()
        {
            InitializeComponent();
            
        }

        private List<ListViewItem> allItems = new List<ListViewItem>();
        private void Form_Load(object sender, EventArgs e)
        {
            allItems.Clear(); // Clear the list before populating
            // Populate the list view with items and store them in the allItems collection
            foreach (ListViewItem item in listView1.Items)
            {
                allItems.Add(item.Clone() as ListViewItem);
                //allItems.Add(item);
            }
        }

        private void OVERSTATS_load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
        }
        private SqlConnection getSGBDConnection()
        {
            //return new SqlConnection("data source= DESKTOP-JH186U7\\SQLEXPRESS;integrated security=true;initial catalog=master");
            return new SqlConnection("data source= tcp:mednat.ieeta.pt\\SQLSERVER,8101; initial catalog=p2g5; uid = p2g5 ; password = cookiemirtilo913!");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            listView1.Items.Clear();
            // Add the header row
            listView1.Columns.Clear();
            listView1.View = View.Details;
            listView1.Columns.Add("ID", 40);
            listView1.Columns.Add("Player", 60);
            listView1.Columns.Add("Name", 80);
            listView1.Columns.Add("Hero", 80);
            listView1.Columns.Add("Map", 80);

            if (checkBox1.Checked)
            {
                listView1.Columns.Add("Result", 40);
            }
            if (checkBox2.Checked)
            {
                listView1.Columns.Add("Accuracy", 60);
            }
            if (checkBox3.Checked)
            {
                listView1.Columns.Add("KDA", 40);
            }
            if (checkBox4.Checked)
            {
                listView1.Columns.Add("Time Played", 80);
            }


            if (!verifySGBDConnection())
                return;

            // use view to show stats (join stats with player)
            SqlCommand cmd = new SqlCommand("SELECT * FROM OVERSTATS.PlayerStatsView;", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            
            while (reader.Read())
            {
                String id = reader["id"].ToString();
                String player = reader["playerId"].ToString();
                String hero= reader["Hero"].ToString();
                String kda = reader["KDA"].ToString();
                String accuracy = reader["Accuracy"].ToString() ;
                String result = reader["Result"].ToString();
                String timeplayed = reader["TimePlayed"].ToString();
                String map = reader["Map"].ToString();
                String nome = reader["PlayerName"].ToString();

                ListViewItem item = new ListViewItem();
                item.Text = id;
                item.SubItems.Add(player);
                item.SubItems.Add(nome);
                item.SubItems.Add(hero);
                item.SubItems.Add(map);

                if (checkBox1.Checked)
                {
                    item.SubItems.Add(result);
                }
                if (checkBox2.Checked)
                {
                    item.SubItems.Add(accuracy);
                }
                if (checkBox3.Checked)
                {
                    item.SubItems.Add(kda);
                }
                if (checkBox4.Checked)
                {
                    item.SubItems.Add(timeplayed);
                }

                listView1.Items.Add(item);
                 
            }

            reader.Close();
            cn.Close();
            Form_Load(sender, new EventArgs());

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void PopulateMaps()
        {
            

            // Fetch the data from the database
            if (!verifySGBDConnection())
                return;

            SqlCommand cmd = new SqlCommand("SELECT * FROM OVERSTATS.MAP", cn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            // Set the data source and enable auto generation of columns
            dataGridView1.AutoGenerateColumns = true;
            dataGridView1.DataSource = dataTable;

            cn.Close();
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedCells.Count > 0)
            {
                // Get the selected map's name
                string selectedMapName = dataGridView1.CurrentRow.Cells["nome"].Value.ToString();

                if (!verifySGBDConnection())
                    return;

                SqlCommand cmd = new SqlCommand("OVERSTATS.GetMapInfo", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MapName", selectedMapName);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                // Set the data source and enable auto generation of columns
                dataGridView3.AutoGenerateColumns = true;
                dataGridView3.DataSource = dataTable;

                cn.Close();
            }
        }



        private void PopulateHeroes()
        {
            dataGridView2.Rows.Clear();
            dataGridView2.Columns.Clear();
            // Fetch the data from the database
            if (!verifySGBDConnection())
                return;
            SqlCommand cmd2 = new SqlCommand("SELECT * FROM OVERSTATS.HERO", cn);
            SqlDataReader reader2 = cmd2.ExecuteReader();

            // Create columns in the DataGridView
            for (int i = 0; i < reader2.FieldCount; i++)
            {
                string columnName = reader2.GetName(i);
                dataGridView2.Columns.Add(columnName, columnName);
            }

            // Iterate through the data and add each row to the DataGridView
            while (reader2.Read())
            {
                object[] rowData = new object[reader2.FieldCount];
                reader2.GetValues(rowData);

                // Add the row to the DataGridView
                dataGridView2.Rows.Add(rowData);
            }
            cn.Close();
        }

        private void PopulateListView2() {

            listView2.View = View.Details;

            if (!verifySGBDConnection())
                return;

            // Retrieve all user names from the database
            SqlCommand getUserNames = new SqlCommand("SELECT nome, main FROM OVERSTATS.PLAYER", cn);
            SqlDataReader reader = getUserNames.ExecuteReader();

            listView2.Items.Clear(); // Assuming you have a ListView named listView2
            listView2.Columns.Clear(); // Clear existing columns

            // Add columns to the ListView
            listView2.Columns.Add("User Name", 100); // column for user names
            listView2.Columns.Add("Mains", 100); // colum for mains 

            while (reader.Read())
            {
                string userName = reader["nome"].ToString();
                string mains = reader["main"].ToString();

                ListViewItem item = new ListViewItem(userName);
                item.SubItems.Add(mains);
                listView2.Items.Add(item);
            }

            reader.Close();
            cn.Close();
        }
        
        private void STATS_Selecting(object sender, TabControlCancelEventArgs e)
        {
            // Check if the selected tab is the one containing the DataGridView
            if (e.TabPage == tabPage4)
            {
                PopulateMaps();
            }
            if (e.TabPage == tabPage3)
            {
                PopulateHeroes();
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            FilterListView();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            FilterListView();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            FilterListView();
        }

        private void FilterListView()
        {
            string playerFilter = textBox1.Text.Trim();
            string heroFilter = textBox2.Text.Trim();
            string mapFilter = textBox3.Text.Trim();

            listView1.BeginUpdate();
            listView1.Items.Clear();

            foreach (ListViewItem item in allItems)
            {
                string player = item.SubItems[1].Text;
                string hero = item.SubItems[3].Text;
                string map = item.SubItems[4].Text;

                if (string.IsNullOrEmpty(playerFilter) || player.StartsWith(playerFilter, StringComparison.OrdinalIgnoreCase))
                {
                    if (string.IsNullOrEmpty(heroFilter) || hero.StartsWith(heroFilter, StringComparison.OrdinalIgnoreCase))
                    {
                        if (string.IsNullOrEmpty(mapFilter) || map.StartsWith(mapFilter, StringComparison.OrdinalIgnoreCase))
                        {
                            //listView1.Items.Add(item);
                            listView1.Items.Add(item.Clone() as ListViewItem);
                        }
                    }

                } 
            }

            listView1.EndUpdate();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (listView2.SelectedItems.Count > 0)
            {
                // Get the selected friend name
                string friendName = listView2.SelectedItems[0].Text;

                //Get the playerId by textBox4
                string playerName = textBox4.Text.Trim();
                int playerId = GetPlayerId(playerName);
                int friendId = GetPlayerId(friendName);

                // Call a method to remove the friend from the database
                AddFriendToDatabase(playerId, friendId);

                // Refresh the list of friends
                PopulateListView3(playerId);
            }

        }

        private void AddFriendToDatabase(int playerId, int friendId)
        {
            if (!verifySGBDConnection())
                return;
            // Add the friend to the database
            try
            {
                SqlCommand addFriend = new SqlCommand("INSERT INTO OVERSTATS.FRIENDS (player1, player2) VALUES (@playerId, @friendId)", cn);
                addFriend.Parameters.AddWithValue("@playerId", playerId);
                addFriend.Parameters.AddWithValue("@friendId", friendId);
                addFriend.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                if (ex.Number == 50000) // Custom error number from the trigger
                {
                    MessageBox.Show("User is already your friend.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    // Handle other SQL exceptions
                    MessageBox.Show("An error occurred while adding the friend.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }

            
            cn.Close();
        }

        private int GetPlayerId(string playerName)
        {
            if (string.IsNullOrEmpty(playerName))
            {
                MessageBox.Show("Please enter a player name.");
                return -1; // Return a default value indicating failure
            }

            if (!verifySGBDConnection())
                return -1; // Return a default value indicating failure

            int playerId;
            string query = $"SELECT OVERSTATS.GetPlayerIdByName('{playerName}') AS PlayerId";
            SqlCommand command = new SqlCommand(query, cn);
            try
            {
                playerId = (int)command.ExecuteScalar();
                return playerId;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Player ID not found.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return -1; // Return a default value indicating failure
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            listView3.View = View.Details;
            listView4.View = View.Details;
            listView5.View = View.Details;

            string playerName = textBox4.Text.Trim();
            int playerId = GetPlayerId(playerName);

            if (playerId == -1)
            {
                return;
            }

            //conectar BD 
            if (!verifySGBDConnection())
                return;

            //update main character with Store Procedure
            using (SqlCommand cmd = new SqlCommand("OVERSTATS.UpdatePlayerMainCharacter", cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                
            }

            //show ranks
            SqlCommand getRanks = new SqlCommand("SELECT * FROM OVERSTATS.RANK WHERE player = @playerId", cn);
            getRanks.Parameters.AddWithValue("@playerId", playerId);

            SqlDataReader rankReader = getRanks.ExecuteReader();

            listView4.Items.Clear(); 
            listView4.Columns.Clear();

            // Add columns to the ListView for ranks
            //listView4.Columns.Add("ID", 30);
            listView4.Columns.Add("Role", 100);
            listView4.Columns.Add("Rank", 100);

            while (rankReader.Read())
            {
                string rankId = rankReader["player"].ToString();
                string rankName = rankReader["teamrole"].ToString();
                string rankScore = rankReader["nome"].ToString();

                //ListViewItem rankItem = new ListViewItem(rankId);
                ListViewItem rankItem = new ListViewItem(rankName);
                //rankItem.SubItems.Add(rankName);
                rankItem.SubItems.Add(rankScore);

                listView4.Items.Add(rankItem);
            }
            rankReader.Close();

            cn.Close();

            PopulateListView3(playerId);
            PopulateListView2();
            PopulateListView5(playerId);
        }

        private void PopulateListView3(int playerId)
        {
            if (!verifySGBDConnection())
                return;

            // Retrieve the friends' names based on the player ID
            SqlCommand getFriends = new SqlCommand("SELECT nome,main FROM OVERSTATS.PLAYER INNER JOIN OVERSTATS.FRIENDS ON (OVERSTATS.FRIENDS.player2 = OVERSTATS.PLAYER.id OR OVERSTATS.FRIENDS.player1 = OVERSTATS.PLAYER.id) WHERE (OVERSTATS.FRIENDS.player1 = @playerId OR OVERSTATS.FRIENDS.player2 = @playerId) AND OVERSTATS.PLAYER.id != @playerId", cn);
            getFriends.Parameters.AddWithValue("@playerId", playerId);

            SqlDataReader reader = getFriends.ExecuteReader();

            listView3.Items.Clear(); // Assuming you have a ListView named listView3
            listView3.Columns.Clear(); // Clear existing columns

            // Add columns to the ListView
            listView3.Columns.Add("Friend Name", 100); //column for friend name
            listView3.Columns.Add("Mains", 100); // collumn for main


            while (reader.Read())
            {
                string friendName = reader["nome"].ToString();
                string mains = reader["main"].ToString();

                ListViewItem item = new ListViewItem(friendName);
                item.SubItems.Add(mains);
                listView3.Items.Add(item);
            }

            cn.Close();
        }

        private void PopulateListView5(int playerId)
        {
            if (!verifySGBDConnection())
                return;

            // Retrieve the stats of the iD
            SqlCommand getIndividualStats = new SqlCommand("SELECT stat_id, hero, map, kda, accuracy, result, time_played FROM OVERSTATS.STATS WHERE player = @playerId", cn);
            getIndividualStats.Parameters.AddWithValue("@playerId", playerId);

            SqlDataReader reader = getIndividualStats.ExecuteReader();

            listView5.Items.Clear(); // Assuming you have a ListView named listView3
            listView5.Columns.Clear(); // Clear existing columns

            // Add columns to the ListView
            listView5.Columns.Add("Game id", 50); //column for game id
            listView5.Columns.Add("Hero", 50); // collumn for main
            listView5.Columns.Add("Map", 50);
            listView5.Columns.Add("KDA", 50);
            listView5.Columns.Add("Accuracy", 50);
            listView5.Columns.Add("Result", 50);
            listView5.Columns.Add("Time_played", 50);

            while (reader.Read())
            {
                string game_id = reader["stat_id"].ToString();
                string hero = reader["hero"].ToString();
                string map = reader["map"].ToString();
                string kda = reader["kda"].ToString();
                string accuracy = reader["accuracy"].ToString();
                string result = reader["result"].ToString();
                string time_played = reader["time_played"].ToString();

                ListViewItem item = new ListViewItem(game_id);
                item.SubItems.Add(hero);
                item.SubItems.Add(map);
                item.SubItems.Add(kda);
                item.SubItems.Add(accuracy);
                item.SubItems.Add(result);
                item.SubItems.Add(time_played);
                listView5.Items.Add(item);
            }

            cn.Close();
        }


        private void button3_Click(object sender, EventArgs e)
        {
            if (listView3.SelectedItems.Count > 0)
            {
                // Get the selected friend name
                string friendName = listView3.SelectedItems[0].Text;

                //Get the playerId by textBox4
                string playerName = textBox4.Text.Trim();
                int playerId = GetPlayerId(playerName);
                int friendId = GetPlayerId(friendName);

                // Call a method to remove the friend from the database
                RemoveFriendFromDatabase(playerId,friendId);

                // Remove the selected item from the ListView
                listView3.SelectedItems[0].Remove();
            }
        }

        private void RemoveFriendFromDatabase(int playerId, int friendId)
        {
            if (!verifySGBDConnection())
                return;

            // Remove the friend from the database using their IDs
            SqlCommand removeFriend = new SqlCommand("DELETE FROM OVERSTATS.FRIENDS WHERE (player1 = @playerId AND player2 = @friendId) OR (player1 = @friendId AND player2 = @playerId)", cn);
            removeFriend.Parameters.AddWithValue("@playerId", playerId);
            removeFriend.Parameters.AddWithValue("@friendId", friendId);
            removeFriend.ExecuteNonQuery();

            cn.Close();
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {

        }

        private void label17_Click(object sender, EventArgs e)
        {

        }

        private void label18_Click(object sender, EventArgs e)
        {

        }

        private void label16_Click(object sender, EventArgs e)
        {

        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            // Check connection
            if (!verifySGBDConnection())
                return;

            try
            {
                // Retrieve the necessary information from user input fields
                string playerName = textBox5.Text.Trim();
                string hero = textBox6.Text.Trim();
                string map = textBox7.Text.Trim();
                int kda = Convert.ToInt32(textBox8.Text.Trim());
                int accuracy = Convert.ToInt32(textBox9.Text.Trim());
                string result = comboBox1.Text.Trim();
                int timePlayed = Convert.ToInt32(textBox11.Text.Trim());

                // Get the player ID using the GetPlayerId function
                int playerId = GetPlayerId(playerName);

                // Create a SQL command to insert the game stat into the STATS table
                SqlCommand insertStat = new SqlCommand("INSERT INTO OVERSTATS.STATS (player, hero, kda, accuracy, result, time_played, map) " +
                                                        "VALUES (@playerId, @hero, @kda, @accuracy, @result, @timePlayed, @map)", cn);

                // Set the parameter values
                insertStat.Parameters.AddWithValue("@playerId", playerId);
                insertStat.Parameters.AddWithValue("@hero", hero);
                insertStat.Parameters.AddWithValue("@kda", kda);
                insertStat.Parameters.AddWithValue("@accuracy", accuracy);
                insertStat.Parameters.AddWithValue("@result", result);
                insertStat.Parameters.AddWithValue("@timePlayed", timePlayed);
                insertStat.Parameters.AddWithValue("@map", map);
           
                // Execute the SQL command
                insertStat.ExecuteNonQuery();

                // Show a success message to the user
                MessageBox.Show("Game stat added successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (SqlException ex)
            {
                if (ex.Errors.Count > 0 && ex.Errors[0].Class == 16) // Check if it's a custom error raised by the trigger
                {
                    // Handle the error returned by the trigger
                    MessageBox.Show(ex.Errors[0].Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    // Handle any other database errors
                    MessageBox.Show("An error occurred while adding the game stat: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                // Handle any other exceptions that occurred during the process
                MessageBox.Show("An error occurred while adding the game stat: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }






        private void listView5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
    
}
