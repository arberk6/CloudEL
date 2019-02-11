<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CEL.Views.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link href="Content/bootstrap.min.css" rel="stylesheet" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title></title>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center" style="height:100vh">
            <div class="col-4">
                <div class="card">
                    <div class="card-body">
    <form id="form1" runat="server">
        <div class="form-group">
            <asp:TextBox required="required" class="form-control" ID="email" runat="server" placeholder="Email"
                pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" oninvalid="setCustomValidity('Ju lutem shkruani nje email valide ')" onchange="try{setCustomValidity('')}catch(e){}"></asp:TextBox>
            
        </div>
        <div class="form-group">
            <asp:TextBox required="required" class="form-control" type="password" ID="password" runat="server" placeholder="Password"
                 oninvalid="setCustomValidity('Ju lutem plotesoni fushen ')" onchange="try{setCustomValidity('')}catch(e){}"></asp:TextBox>
        </div>
        <div id="alert" style="display: none;" runat="server" class="alert alert-danger" role="alert">
            <asp:Label ID="Mesazhi" runat="server" Text="Te dhenat nuk jate te sakta"></asp:Label>
        </div>
        <asp:Button class="btn btn-primary" ID="submit" runat="server" Text="Login" onClick="Login"/>
    </form>
                          </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>