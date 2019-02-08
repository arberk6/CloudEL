<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Login.Master" AutoEventWireup="true" CodeBehind="ZgjedhKurset.aspx.cs" Inherits="CEL.Views.Studenti.ZgjedhKurset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span>Lenda: </span>
    <br />
    <asp:dropdownlist ID="Lenda" runat="server"></asp:dropdownlist>
    <br />
    <br />
    <span>Profesori: </span>
    <br />
    <asp:dropdownlist ID="Profesori" runat="server"></asp:dropdownlist>
    <br />
    <br />
    <asp:button runat="server" text="Apliko" OnClick="Apliko_Click" />
</asp:Content>
