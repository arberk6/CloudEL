<%@ Page Title="" Language="C#" MasterPageFile="~/Views/StudentiView/Student.Master" AutoEventWireup="true" CodeBehind="AplikoPerKurse.aspx.cs" Inherits="CEL.Views.StudentiView.AplikoPerKurse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:TextBox id="SearchTextBox" runat="server" />
        <asp:Button id="SearchButton" runat="server" text="Kerko kursin" OnClick="SearchButton_Click" />
        <span>* Kerko ne baze te emrit</span>
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
            EnableViewState="False"
            OnPageIndexChanging="ListGridView_PageIndexChanging">
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
                <asp:TemplateField HeaderText="Profesori" ItemStyle-Width="20%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="EmriProfes" runat="server" Text='<%# Bind("EmriProfes") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--Kreditet--%>
                <asp:TemplateField HeaderText="Kreditet" ItemStyle-Width="10%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="EmriProfes" runat="server" Text='<%# Bind("EmriProfes") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--Nr i Ligjeratave--%>
                <asp:TemplateField HeaderText="Numri i ligj." ItemStyle-Width="10%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="NumriLigjeratave" runat="server" Text='<%# Bind("NumriLigjeratave") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--Nr i Ushtrimeve--%>
                <asp:TemplateField HeaderText="Numri i ushtr." ItemStyle-Width="10%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:Label ID="NumriUshtrimeve" runat="server" Text='<%# Bind("NumriUshtrimeve") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <%--Apliko ne kete kurse--%>
                <asp:TemplateField HeaderText="Apliko" ItemStyle-Width="5%" InsertVisible="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="AplikoKursinButton" ImageUrl="~/Img/edit.png" runat="server" CommandName="Ndrysho" CommandArgument='<%# Bind("KursiID") %>' ToolTip="Apliko" Width="20px" Height="20px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
</div>
</asp:Content>
