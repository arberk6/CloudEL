<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AdministratoriView/Administratori.Master" AutoEventWireup="true" CodeBehind="KerkesaDetails.aspx.cs" Inherits="CEL.Views.AdministratoriView.KerkesaDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button class="btn btn-primary" ID="KthehuButton" runat="server" Text="Kthehu" OnClick="Kthehu_OnClick"/>
    <asp:GridView ID="ListGridView" runat="server" 
            CellPadding="4" ForeColor="#333333"
            CssClass="table table-striped table-bordered table-condensed"
            AllowPaging="True"
            PageSize="21"
            AllowSorting="True"
            AutoGenerateColumns="False"
            Width="100%"
            EditIndex="1"
            EnableViewState="true"
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

                <%--student id--%>
                <asp:TemplateField HeaderText="Student ID">
                    <ItemTemplate>
                        <asp:Label ID="StudentIDLabel" runat="server" Text='<%# Bind("StudentiID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--profesori--%>
                <asp:TemplateField HeaderText="Emri">
                    <ItemTemplate>
                        <asp:Label ID="EmriLabel" runat="server" Text='<%# Bind("Emri") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--numri studenteve--%>
                <asp:TemplateField HeaderText="Mbiemri">
                    <ItemTemplate>
                        <asp:Label ID="MbiemriLabel" runat="server" Text='<%# Bind("Mbiemri") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--programi--%>
               <asp:TemplateField HeaderText="Programi">
                    <ItemTemplate>
                        <asp:Label ID="ProgramiLabel" runat="server" Text='<%# Bind("Programi") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--aprovo--%>
                <asp:TemplateField HeaderText="Aprovo" ItemStyle-Width="10px" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Button ID="AprovoButton" text="Aprovo" runat="server" CommandName="Aprovo" CommandArgument='<%# Bind("StudentiID") %>' ToolTip="Aprovo"  />
                    </ItemTemplate>
                </asp:TemplateField>
               
                <%--refuzo--%>
                <asp:TemplateField HeaderText="Refuzo" ItemStyle-Width="10px"  InsertVisible="False">
                    <ItemTemplate>
                        <asp:Button ID="RefuzoButton" text="refuzo" runat="server" CommandName="Refuzo" CommandArgument='<%# Bind("StudentiID") %>' ToolTip="Refuzo"  />
                    </ItemTemplate>
                </asp:TemplateField>

              
            </Columns>
        </asp:GridView>
</asp:Content>
