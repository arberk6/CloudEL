<%@ Page Title="" Language="C#" MasterPageFile="~/Views/HrPunetore/HrPunetore.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HR_Management_V1._3.Views.HrPunetore.index1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/HrPunetore.css" rel="stylesheet" />
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" ID="NrPunetoreveLabel" Text="Numri i punetoreve: "></asp:Label>
    <asp:Label runat="server" ID="PunetoretNrLabel"></asp:Label>
    <br />
    <asp:Label runat="server" ID="NrDepartamenteveLabel" Text="Numri i departamenteve: "></asp:Label>
    <asp:Label runat="server" ID="DepartamentetNrLabel"></asp:Label>
    <br />
    <asp:Label runat="server" ID="NrFilialeveLabel" Text="Numri i filialeve: "></asp:Label>
    <asp:Label runat="server" ID="FilialetNrLabel"></asp:Label>
</asp:Content>