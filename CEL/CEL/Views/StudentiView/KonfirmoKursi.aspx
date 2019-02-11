<%@ Page Title="" Language="C#" MasterPageFile="~/Views/StudentiView/Student.Master" AutoEventWireup="true" CodeBehind="KonfirmoKursi.aspx.cs" Inherits="CEL.Views.StudentiView.KonfirmoKursi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:dotted; width:350px; height:100px;">
        <asp:Label runat="server" ID="mesazhi" Text="A jeni i sigurte qe deshironi te regjistroni kete kurse?"></asp:Label>
        <br />
        <br />
        <asp:Button runat="server" OnClick="AplikoButton_Click" ID="Apliko" text="Apliko"/>
        <asp:Button runat="server" OnClick="AnuloButton_Click" ID="Anulo" text="Anulo"/>
        <br />
        <asp:Label runat="server" ID="MesazhiLabel"></asp:Label>
    </div>
</asp:Content>
