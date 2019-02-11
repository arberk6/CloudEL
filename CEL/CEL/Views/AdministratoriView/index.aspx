<%@ Page Title="" Language="C#" MasterPageFile="~/Views/AdministratoriView/Administratori.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CEL.Views.AdministratoriView.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="MesazhiLabel" runat="server" Text="" />
        <asp:GridView ID="ListGridView" runat="server" 
            CellPadding="4" ForeColor="#333333"
            CssClass="table table-striped table-bordered table-condensed"
            AllowPaging="True"
            PageSize="21"
            AllowSorting="True"
            AutoGenerateColumns="False"
            Width="100%"
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

                <asp:TemplateField HeaderText="Kursi">
                    <ItemTemplate>
                        <asp:Label ID="KursiLabel" runat="server" Text='<%# Bind("KursiID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Profesori">
                    <ItemTemplate>
                        <asp:Label ID="ProfesoriLabel" runat="server" Text='<%# Bind("PersoniID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--numri studenteve--%>
                <asp:TemplateField HeaderText="Numri studenteve">
                    <ItemTemplate>
                        <asp:Label ID="NumriStuLabel" runat="server" Text='<%# Bind("PersoniID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <%--details--%>
              <asp:TemplateField HeaderText="Aprovo" ItemStyle-Width="10px" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Button ID="AprovoButton" text="Aprovo" runat="server" CommandName="Aprovo" CommandArgument='<%# Bind("requestid") %>' ToolTip="Aprovo"  />
                    </ItemTemplate>
                </asp:TemplateField>
               
                <%--aprovo--%>
                <asp:TemplateField HeaderText="Aprovo" ItemStyle-Width="10px" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Button ID="AprovoButton" text="Aprovo" runat="server" CommandName="Aprovo" CommandArgument='<%# Bind("requestid") %>' ToolTip="Aprovo"  />
                    </ItemTemplate>
                </asp:TemplateField>
               
                <%--refuzo--%>
                <asp:TemplateField HeaderText="Aprovo" ItemStyle-Width="10px" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Button ID="AprovoButton" text="Aprovo" runat="server" CommandName="Aprovo" CommandArgument='<%# Bind("requestid") %>' ToolTip="Aprovo"  />
                    </ItemTemplate>
                </asp:TemplateField>

              
            </Columns>
        </asp:GridView>
</asp:Content>
