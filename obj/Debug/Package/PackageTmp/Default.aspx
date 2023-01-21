<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AzureConn.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 224px;
        }
        .auto-style2 {
            margin-bottom: 0px;
        }
        .auto-style3 {
            width: 224px;
            height: 20px;
        }
        .auto-style4 {
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">Full Address</td>
                    <td>
            <asp:TextBox ID="txtFullAddress" runat="server" Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">CNAme Address</td>
                    <td>
            <asp:TextBox ID="txtCNameAddress" runat="server" Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Database Name</td>
                    <td><asp:TextBox ID="txtDatabaseName" runat="server" Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">User Id</td>
                    <td><asp:TextBox ID="txtUserId" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Password</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Width="300px"></asp:TextBox> (web, prod or any)
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        Query string</td>
                    <td class="auto-style4">
            <asp:TextBox ID="txtQuery" runat="server" Width="600px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        Indented</td>
                    <td class="auto-style4">
                        <asp:RadioButton ID="rdoTrue" GroupName="radIndent" runat="server" />
                        <label for="rdoTrue">True</label> 
                        <asp:RadioButton ID="rdoFalse" GroupName="radIndent" runat="server" Checked="true" />
                        <label for="rdoFalse">False</label> 
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <br />
                        Selected Server name</td>
                    <td class="auto-style4">
                        <br />
            <asp:Label ID="Label1" runat="server" Width="600px" CssClass="auto-style2"></asp:Label>
                    </td>
                </tr>
            </table>
&nbsp;<br />
            <br />
            <asp:Button ID="btnFullAddress" runat="server" Text="Full Address" OnClick="btnFullAddress_Click" />&nbsp;
            <asp:Button ID="btnCNameAddress" runat="server" Text="CNAME" OnClick="btnCNameAddress_Click" />
            <br />
            <br />
            Results :<br />
            <asp:TextBox ID="txtResults" runat="server" Height="301px" TextMode="MultiLine" Width="807px"></asp:TextBox>

        </div>
    </form>
</body>
</html>
