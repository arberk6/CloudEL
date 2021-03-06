﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ProfesoriView/Profesori.Master" AutoEventWireup="true" CodeBehind="Studentet.aspx.cs" Inherits="CEL.Views.ProfesoriView.Studentet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DropDownList CssClass="form-control" ID="FilterKerkimiDropDown"  runat="Server" Height="35px" Width="172px">
            <asp:ListItem>Te gjitha</asp:ListItem>
        </asp:DropDownList>

     <asp:GridView ID="ListGridView" runat="server"
            CellPadding="4" ForeColor="#333333"
            CssClass="table table-striped table-bordered table-condensed"
            AllowPaging="True"
            Width="100%"
            PageSize="21"
            AllowSorting="True"
            AutoGenerateColumns="False"
            EditIndex="1"
            EnableViewState="False"
            OnPageIndexChanging="ListGridView_PageIndexChanging"
            OnRowCommand="ListGridView_RowCommand"
            OnSelectedIndexChanged="ListGridView_SelectedIndexChanged">
            <PagerSettings PageButtonCount="20" FirstPageText="fillimi" LastPageText="fundi" />
            <RowStyle HorizontalAlign="Center" />


            <%--DIZAJNI--%>
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#379dc3" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#379dc3" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
            <RowStyle HorizontalAlign="Center" />
            <PagerSettings PageButtonCount="20" FirstPageText="fillimi" LastPageText="fundi" />


            <Columns>

                <%--EMRI--%>
                <asp:TemplateField HeaderText="Emri" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="EmriLabel" runat="server" Text='<%# Bind("Emri") %>' />
                    </ItemTemplate>
                </asp:TemplateField>


                <%--Mbiemri--%>
                <asp:TemplateField HeaderText="Mbiemri" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="MbiemriLabel" Text='<%# Bind("Mbiemri") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--Mbiemri--%>
                <asp:TemplateField HeaderText="Email" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="EmailLabel" Text='<%# Bind("Email") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--Mbiemri--%>
                <asp:TemplateField HeaderText="Email" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="Label1" Text='<%# Bind("Kursi") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
        </asp:GridView>

</asp:Content>
