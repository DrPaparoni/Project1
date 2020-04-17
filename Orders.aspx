<!--

Original Author: Eric Walter
Date Created: 8/28/2019
Version: 5
Date Last Modified: 4/17/2020
Modified by: Eric Walter
Modification log: Added social media links
added favicons 
added title and description
changed name to "Orders"

added font styles
This is the final version

added link to admin page
-->

<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "evajones"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC InsertVisitor @nameTextBox, @phoneTextBox, @emailTextBox, @subSpinTextBox, @rangeBoxTextBox, @empID", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@phoneTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@phoneTextBox"].Value = phone.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = mail.Text;
            comm.Parameters.Add("@subSpinTextBox", System.Data.SqlDbType.Int);
            comm.Parameters["@subSpinTextBox"].Value = subSpin.SelectedValue;
            comm.Parameters.Add("@rangeBoxTextBox", System.Data.SqlDbType.Int);
            comm.Parameters["@rangeBoxTextBox"].Value = rangeBox.SelectedValue;

            comm.Parameters.Add("@empID", System.Data.SqlDbType.Int);
            comm.Parameters["@empID"].Value = 1;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server"
>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" /> 
    <meta name="description" content="Premier Photo Productions, a Boise Idaho local company. We have affordable rates for all our photographs.">
    <title>Contact Us</title>
<!-- font style -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet"> 
<!-- External Style Sheet -->
    <link href="css/styles.css" rel="stylesheet" media="screen"/>
    <link href="css/print.css" rel="stylesheet" media="print"/>   
    
<!-- Favicons -->
    <link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
</head>
<!-- Main Body-->
<body>

    <nav class="horizontal" id="links">
        <a id="navicon" href="#"><img src="images/navicon.png"/></a>
        <ul>
            <li><a href="Landing.html">Home</a></li>
            <li><a href="About.html">About</a></li>
            <li><a href="Gallery.html">Gallery</a></li>
            <li><a href="Orders.html">Orders</a></li>
            <li><a href="login.php">Admin</a></li>
        </ul>
    </nav>
    <h1>Book a Photographer</h1>

<!--    Contact Form     -->

    <form id="contact" name="form1" runat="server">
        <fieldset id="custInfo">
            <legend>Order our services</legend>

            <div class="formRow">
                <label for="name">Name:</label>
                 <%--<input type="text" name="name" id="name"/>--%>
                <asp:TextBox ID="name" runat="server" />

            </div>

            <div class="formRow">
                <label for="phone">Phone number:</label>
                <%--<input name="custPhone" id="phone" type="tel" placeholder="(nnn) nnn-nnnn" pattern="^\d{10}$|^(\(\d{3}\)\s*)?\d{3}[\s-]?\d{4}$" />--%>
                <asp:TextBox ID="phone" runat="server" />
            </div>

            <div class="formRow">
                    <label for="mail">E-Mail:</label>
                    <%--<input type="text" name="email" id="email"/>--%>
                    <asp:TextBox ID="mail" runat="server" />

                </div>

            <div class="formRow">
                <label for="subSpin">How many subjects will be photographed?</label>
                <%--<input name="subNum" id="subSpin" type="number" value="1" step="1" min="1" max="10">--%>
                <asp:DropDownList ID="subSpin" runat="server">
                    <asp:ListItem Value="1"></asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                    <asp:ListItem Value="3"></asp:ListItem>
                    <asp:ListItem Value="4"></asp:ListItem>
                    <asp:ListItem Value="5"></asp:ListItem>
                    <asp:ListItem Value="6"></asp:ListItem>
                    <asp:ListItem Value="7"></asp:ListItem>
                    <asp:ListItem Value="8"></asp:ListItem>
                    <asp:ListItem Value="9"></asp:ListItem>
                    <asp:ListItem Value="10"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="formRow">
                <label for="rangeBox">How many hours would you like my services?</label>
                
                <%--<input name="hourRate" id="rangeBox" type="range" value="2" step="1" min="1" max="3">--%>
                <asp:DropDownList ID="rangeBox" runat="server">
                    <asp:ListItem Value="1"></asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                    <asp:ListItem Value="3"></asp:ListItem>
                </asp:DropDownList>
                
            </div>
        </fieldset>        

        <div id="buttons">
            <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
<br />
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>

        <input type="reset" value="Cancel" />
        </div>
    </form>

    <footer>
        &#169; Premier Photo Productions. <br>
        This website is for educational purposes and has no affiliation with any company.<br/><br/>
        <a href="https://instagram.com/" target="_blank"><img src="images/iconmonstr-instagram-1-48.png" alt="social icon for instagram"></a>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <a href="https://www.twitter.com/" target="_blank"><img src="images/iconmonstr-twitter-3-48.png" alt="social icon for twitter"></a>
    </footer>
</body>