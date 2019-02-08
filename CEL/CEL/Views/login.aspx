<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CEL.Views.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Style/Login.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div class="main">
                <asp:ImageButton ID="Logo" ImageUrl="~/img/logo.png" runat="server" Width="95%" Height="100px" />
               <br />
            <br />
            <div style="margin: auto;">
                <div class="textBoxes">
                    <span>ID: </span>
                    <br />
                    <asp:TextBox ID="username" runat="server" Text="" Width="155px"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="loginValidation" CssClass="validationMessage" ID="usernameRequiredFieldValidator" runat="server" ControlToValidate="username" ErrorMessage="username nuk duhet te jete i zbrazet"
                        Display="dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <span>Fjalekalimi: </span>
                    <br />  
                    <asp:TextBox ID="password" type="password" Text="kosova" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="loginValidation" CssClass="validationMessage" ID="passwordRequiredFieldValidator" runat="server" ControlToValidate="password" ErrorMessage="password nuk duhet te jete i zbrazet"
                        Display="dynamic"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="Mesazhi" runat="server" Text=""></asp:Label>
                </div>
                <br />
                <asp:Button ValidationGroup="loginValidation" ID="RegjistroButton" class="Regjistro" runat="server" Text="Kyqu" CssClass="btn btn-primary" OnClick="Login_Click" />
            </div>
        </div>
    </div>

</asp:Content>



