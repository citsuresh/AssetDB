<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" EnableEventValidation="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlOrders" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        SelectCommand="usp_OrderSelectAll" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

    <fieldset>
        <legend>Filter</legend>
        
    </fieldset>


    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" 
        DataSourceID="SqlOrders" ForeColor="#333333" GridLines="None" 
        HorizontalAlign="Center" Width="920px" AllowPaging="True" PageSize="20" 
        onrowdatabound="GridView1_RowDataBound" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" >
            <ControlStyle CssClass="HiddenColumn" />
            <FooterStyle CssClass="HiddenColumn" />
            <HeaderStyle CssClass="HiddenColumn" />
            <ItemStyle CssClass="HiddenColumn" />
            </asp:CommandField>
            <asp:BoundField DataField="ID" HeaderText="ID" 
                SortExpression="ID" />
            <asp:BoundField DataField="OrderType" HeaderText="Order Type" 
                SortExpression="OrderType" />
            <asp:BoundField DataField="PurchaseOrderNo" HeaderText="Purchase Order No" 
                SortExpression="PurchaseOrderNo" />
            <asp:BoundField DataField="RequisitionNo" HeaderText="Requisition No" 
                SortExpression="RequisitionNo" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="Supplier" HeaderText="Supplier" 
                SortExpression="Supplier" />
            <asp:BoundField DataField="CallReference" HeaderText="Call Reference" 
                SortExpression="CallReference" />
            <asp:BoundField DataField="CostCode" HeaderText="Cost Code" 
                SortExpression="CostCode" />
            <asp:BoundField DataField="InvoiceNo" HeaderText="Invoice No" 
                SortExpression="InvoiceNo" />
            <asp:BoundField DataField="OrderDate" DataFormatString="{0:d}" 
                HeaderText="Order Date" SortExpression="OrderDate" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Center" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>

