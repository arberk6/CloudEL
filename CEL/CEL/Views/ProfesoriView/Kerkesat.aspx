<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ProfesoriView/Profesori.Master" AutoEventWireup="true" CodeBehind="Kerkesat.aspx.cs" Inherits="CEL.Views.ProfesoriView.Kerkesat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DropDownList ID="FilterKerkimiDropDown"  runat="Server" Height="28px" Width="172px">
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
                <%--ID--%>
                <asp:TemplateField HeaderText="ID e kerkeses" ItemStyle-Width="10px" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="IDLabel" Text='<%# Bind("requestid") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>

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
                        <asp:Label ID="EmailLabel" Text='<%# Bind("Kursi") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--EDITO--%>
                <asp:TemplateField HeaderText="Prano" ItemStyle-Width="10px" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Button class="btn btn-primary" ID="PranoButton" Text="Prano" runat="server" CommandName="Ndrysho" CommandArgument='<%# Bind("requestid") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>


                <%--FSHIJ--%>
                <asp:TemplateField HeaderText="Fshij" ItemStyle-Width="10px" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Button class="btn btn-danger" ID="FshijButton" Text="Fshij" runat="server" CommandName="Fshij" CommandArgument='<%# Bind("requestid") %>' />
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
        </asp:GridView>
</asp:Content>
