<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewOrders.aspx.cs" Inherits="Orders_NewOrders" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlOrder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        DeleteCommand="usp_OrderDelete" DeleteCommandType="StoredProcedure" 
        InsertCommand="usp_OrderInsert" InsertCommandType="StoredProcedure" 
        SelectCommand="usp_OrderSelect" SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_OrderUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderType" Type="String" />
            <asp:Parameter Name="PurchaseOrderNo" Type="String" />
            <asp:Parameter Name="RequisitionNo" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Supplier" Type="String" />
            <asp:Parameter Name="CallReference" Type="String" />
            <asp:Parameter Name="CostCode" Type="String" />
            <asp:Parameter Name="InvoiceNo" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="OrderType" Type="String" />
            <asp:Parameter Name="PurchaseOrderNo" Type="String" />
            <asp:Parameter Name="RequisitionNo" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Supplier" Type="String" />
            <asp:Parameter Name="CallReference" Type="String" />
            <asp:Parameter Name="CostCode" Type="String" />
            <asp:Parameter Name="InvoiceNo" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <fieldset>
    <legend>Order</legend>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" 
        DataSourceID="SqlOrder" DefaultMode="Insert">
        <InsertItemTemplate>
         <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            SelectedValue='<%# Bind("OrderType") %>' 
                RepeatDirection="Horizontal">
                            <asp:ListItem>Hardware</asp:ListItem>
                            <asp:ListItem>Software</asp:ListItem>
                        </asp:RadioButtonList>

            <table class="style1">
                <tr>
                    <td>
                        Purchase Order No:</td>
                    <td>
                        <asp:TextBox ID="PurchaseOrderNoTextBox" runat="server" 
                            Text='<%# Bind("PurchaseOrderNo") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Requisition No:</td>
                    <td>
                        <asp:TextBox ID="RequisitionNoTextBox" runat="server" 
                            Text='<%# Bind("RequisitionNo") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Supplier:</td>
                    <td>
                        <asp:TextBox ID="SupplierTextBox" runat="server" 
                            Text='<%# Bind("Supplier") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Order Date:</td>
                    <td>
                        <asp:TextBox ID="OrderDateTextBox" runat="server" 
                            Text='<%# Bind("OrderDate") %>' Width="105px" />
                        <asp:CalendarExtender ID="OrderDateTextBox_CalendarExtender" runat="server" 
                            Enabled="True" FirstDayOfWeek="Monday" Format="dd/MM/yyyy" 
                            TargetControlID="OrderDateTextBox">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        Call Reference:</td>
                    <td>
                        <asp:TextBox ID="CallReferenceTextBox" runat="server" 
                            Text='<%# Bind("CallReference") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Cost Code:</td>
                    <td>
                        <asp:TextBox ID="CostCodeTextBox" runat="server" 
                            Text='<%# Bind("CostCode") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Invoice No:</td>
                    <td>
                        <asp:TextBox ID="InvoiceNoTextBox" runat="server" 
                            Text='<%# Bind("InvoiceNo") %>' />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        Status:</td>
                    <td>
                        <asp:DropDownList ID="StatusTextBox" runat="server" 
                            Text='<%# Bind("Status") %>' Width="110px" >
                            <asp:ListItem>Planned</asp:ListItem>
                            <asp:ListItem>Ordered</asp:ListItem>
                            <asp:ListItem>Dispatched</asp:ListItem>
                            <asp:ListItem>Complete</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
       
    </asp:FormView>
    </fieldset>
</asp:Content>

