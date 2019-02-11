<%@ Page Title="" Language="C#" MasterPageFile="~/Views/StudentiView/Student.Master" AutoEventWireup="true" CodeBehind="ZgjedhKurset.aspx.cs" Inherits="CEL.Views.StudentiView.ZgjedhKurset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:button runat="server" text="Regjistro kurse" OnClick="Apliko_Click" />
    </div>
  
    <div><asp:GridView ID="ListGridView" runat="server"
            CellPadding="4" ForeColor="#333333"
            CssClass="table table-striped table-bordered table-condensed"
            AllowPaging="True"
            PageSize="21"
            AllowSorting="True"
            AutoGenerateColumns="False"
            Width="100%"
            EditIndex="1"
            EnableViewState="False">
            <PagerSettings PageButtonCount="20" FirstPageText="fillimi" LastPageText="fundi" />
            <RowStyle HorizontalAlign="Center" />


            <%--DIZAJNI--%>
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
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
                <%--Emri i kursit--%>
                <asp:TemplateField HeaderText="Kursi" ItemStyle-Width="40%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="EmriKursit" Text='<%# Bind("EmriKursit") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--Emri dhe mbiemri i profesorit--%>
                <asp:TemplateField HeaderText="Profesori" ItemStyle-Width="15%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="EmriProfes" runat="server" Text='<%# Bind("EmriProfes") %>' />
                    </ItemTemplate>
                </asp:TemplateField>


                <%--Data e aplikimit--%>
                <asp:TemplateField HeaderText="Data e aplikimit" ItemStyle-Width="10%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="RequestCreatedDate" Text='<%# Bind("RequestCreatedDate") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>


                <%--Aprovuar nga Profesori--%>
                <asp:TemplateField HeaderText="Aprovuar nga profesori" ItemStyle-Width="15%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="aprovuarNgaProfesori" Text='<%# Bind("aprovuarNgaProfesori") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>


                <%--Aprovuar nga Administratori--%>
                <asp:TemplateField HeaderText="Aprovuar nga administratori" ItemStyle-Width="15%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="aprovuarNgaAdministratori" Text='<%# Bind("aprovuarNgaAdministratori") %>' runat="Server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</div>
</asp:Content>
