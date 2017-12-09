<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="Orders_OrderDetail" %>

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
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32"  />
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
    <asp:SqlDataSource ID="SqlOrderItems" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        DeleteCommand="usp_OrderItemsDelete" DeleteCommandType="StoredProcedure" 
        InsertCommand="usp_OrderItemsInsert" InsertCommandType="StoredProcedure" 
        SelectCommand="usp_OrderItemsSelect" SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_OrderItemsUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="MakeOrPublisher" Type="String" />
            <asp:Parameter Name="ModelOrTitle" Type="String" />
            <asp:Parameter Name="Version" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Value" Type="Decimal" />
            <asp:Parameter Name="Status" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="MakeOrPublisher" Type="String" />
            <asp:Parameter Name="ModelOrTitle" Type="String" />
            <asp:Parameter Name="Version" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Value" Type="Decimal" />
            <asp:Parameter Name="Status" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlOrderHardwareType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        SelectCommand="usp_OrderHardwareTypeLookup" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

 <fieldset>
    <legend>Order</legend>
    <asp:FormView ID="FormViewOrder" runat="server" DataKeyNames="ID,OrderType" 
        DataSourceID="SqlOrder" DefaultMode="ReadOnly" 
         ondatabound="FormViewOrder_DataBound">
        <EmptyDataTemplate>
            No Orders Selected
            <asp:TextBox ID="TextType1" runat="server" Text='<%# Bind("OrderType") %>' Visible="False"></asp:TextBox>
        </EmptyDataTemplate>
        <ItemTemplate>
         <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            SelectedValue='<%# Bind("OrderType") %>' 
                RepeatDirection="Horizontal" Enabled="False">
                            <asp:ListItem>Hardware</asp:ListItem>
                            <asp:ListItem>Software</asp:ListItem>
                        </asp:RadioButtonList>

                <asp:Textbox ID="TextType1" runat="server" Text='<%# Bind("OrderType") %>' Visible="False">  </asp:TextBox>
 
                <table class="style1">
                    <tr>
                        <td>
                            Purchase Order No:</td>
                        <td>
                            <asp:Label ID="PurchaseOrderNoLabel" runat="server" 
                                Text='<%# Bind("PurchaseOrderNo") %>' ForeColor="Black" />
                        </td>
                        <td width="25">
                            &nbsp;</td>
                        <td>
                            Requisition No:</td>
                        <td>
                            <asp:Label ID="RequisitionNoLabel" runat="server" 
                                Text='<%# Bind("RequisitionNo") %>' ForeColor="Black" />
                        </td>
                        <td width="25">
                            &nbsp;</td>
                        <td>
                            Supplier:</td>
                        <td>
                            <asp:Label ID="SupplierLabel" runat="server" Text='<%# Bind("Supplier") %>' ForeColor="Black" />
                        </td>
                        <td width="25">
                            &nbsp;</td>
                        <td>
                            Order Date:</td>
                        <td>
                            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Bind("OrderDate", "{0:d}" ) %>' ForeColor="Black" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Call Reference:</td>
                        <td>
                            <asp:Label ID="CallReferenceLabel" runat="server" 
                                Text='<%# Bind("CallReference") %>' ForeColor="Black" />
                        </td>
                        <td width="25">
                            &nbsp;</td>
                        <td>
                            Cost Code:</td>
                        <td>
                            <asp:Label ID="CostCodeLabel" runat="server" Text='<%# Bind("CostCode") %>' ForeColor="Black" />
                        </td>
                        <td width="25">
                            &nbsp;</td>
                        <td>
                            Invoice No:</td>
                        <td>
                            <asp:Label ID="InvoiceNoLabel" runat="server" Text='<%# Bind("InvoiceNo") %>' ForeColor="Black" />
                        </td>
                        <td width="25">
                            &nbsp;</td>
                        <td>
                            Status:</td>
                        <td>
                            <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' ForeColor="Black" />
                        </td>
                    </tr>
            </table>
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
               
            </ItemTemplate>
         <EditItemTemplate>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                            SelectedValue='<%# Bind("OrderType") %>' 
                RepeatDirection="Horizontal" Enabled="False">
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
                            Text='<%# Bind("OrderDate", "{0:d}") %>' Width="105px" />
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
       
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
       
       
    </asp:FormView>
       
    </fieldset>

    <asp:Panel ID="PanelHardware" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
   
        <fieldset>
        <legend>Hardware Order Details</legend>


        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" 
            DataSourceID="SqlOrderItems" InsertItemPosition="LastItem" 
                oniteminserting="ListView1_ItemInserting" 
                onitemupdating="ListView1_ItemUpdating">
            <EditItemTemplate>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                   
                    <td>
                        <asp:DropDownList ID="TypeDropDownList" runat="server" Text='<%# Bind("Type") %>'
                        DataSourceID="SqlOrderHardwareType" DataTextField="HardwareType" 
                        DataValueField="HardwareType" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="" Text="Please Select"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="MakeOrPublisherTextBox" runat="server" Width="125" 
                            Text='<%# Bind("MakeOrPublisher") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ModelOrTitleTextBox" runat="server" Width="150"
                            Text='<%# Bind("ModelOrTitle") %>' />
                    </td>
                   
                    <td>
                        <asp:TextBox ID="QuantityTextBox" runat="server" Width="60"
                            Text='<%# Bind("Quantity") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value") %>' Width="60"/>
                    </td>
                    <td>
                        <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' Width="100"/>
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert"  />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </td>
                   
                    <td>
                     <asp:DropDownList ID="TypeDropDownList" runat="server" Text='<%# Bind("Type") %>'
                        DataSourceID="SqlOrderHardwareType" DataTextField="HardwareType" 
                        DataValueField="HardwareType" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="" Text="Please Select"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="MakeOrPublisherTextBox" runat="server" 
                            Text='<%# Bind("MakeOrPublisher") %>'  Width="125"/>
                    </td>
                    <td>
                        <asp:TextBox ID="ModelOrTitleTextBox" runat="server" 
                            Text='<%# Bind("ModelOrTitle") %>'  Width="150"/>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="QuantityTextBox" runat="server" 
                            Text='<%# Bind("Quantity") %>' Width="60" />
                    </td>
                    <td>
                        <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value", "{0:c}") %>' Width="60" />
                    </td>
                    <td>
                        <asp:DropDownList ID="StatusDropDown" runat="server" Text='<%# Bind("Status") %>' Width="100">
                        <asp:ListItem>Due</asp:ListItem>
                        <asp:ListItem>Arrived</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="" align="center">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                 
                    <td>
                        <asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' />
                    </td>
                    <td>
                        <asp:Label ID="MakeOrPublisherLabel" runat="server" 
                            Text='<%# Eval("MakeOrPublisher") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ModelOrTitleLabel" runat="server" 
                            Text='<%# Eval("ModelOrTitle") %>' />
                    </td>
                                        <td>
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value", "{0:c}") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">
                                    </th>
                                  
                                    <th runat="server">
                                        Type</th>
                                    <th runat="server">
                                        Make</th>
                                    <th runat="server">
                                        Model</th>
                                    <th runat="server">
                                        Quantity</th>
                                    <th runat="server">
                                        Value</th>
                                    <th runat="server">
                                        Status</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
          
        </asp:ListView>
    
    </fieldset>
    
    </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Panel>
	
	
    <asp:Panel ID="PanelSoftware" runat="server">

        <asp:UpdatePanel ID="UpdatePanelSoftware" runat="server">
    <ContentTemplate>
         <fieldset>
        <legend>Software Order Details</legend>
    
        <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" 
            DataSourceID="SqlOrderItems" InsertItemPosition="LastItem" 
                 oniteminserting="ListView2_ItemInserting" 
                 onitemupdating="ListView2_ItemUpdating">
           
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                   
                    
                    <td>
                        <asp:TextBox ID="MakeOrPublisherTextBox" runat="server" 
                            Text='<%# Bind("MakeOrPublisher") %>' Width="125"/>
                    </td>
                    <td>
                        <asp:TextBox ID="ModelOrTitleTextBox" runat="server" 
                            Text='<%# Bind("ModelOrTitle") %>' Width="175"/>
                    </td>
                    <td>
                        <asp:TextBox ID="VersionTextBox" runat="server" Text='<%# Bind("Version") %>'  Width="75" />
                    </td>
                    <td>
                        <asp:TextBox ID="QuantityTextBox" runat="server" 
                            Text='<%# Bind("Quantity") %>'  Width="60" />
                    </td>
                    <td>
                        <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value") %>'  Width="60" />
                    </td>
                    <td>
                       <asp:DropDownList ID="StatusDropDown" runat="server" Text='<%# Bind("Status") %>' Width="100">
                        <asp:ListItem>Due</asp:ListItem>
                        <asp:ListItem>Arrived</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </td>
                   
                   
                    <td>
                        <asp:TextBox ID="MakeOrPublisherTextBox" runat="server" 
                            Text='<%# Bind("MakeOrPublisher") %>'  Width="125"/>
                    </td>
                    <td>
                        <asp:TextBox ID="ModelOrTitleTextBox" runat="server" 
                            Text='<%# Bind("ModelOrTitle") %>'  Width="175"/>
                    </td>
                    <td>
                        <asp:TextBox ID="VersionTextBox" runat="server" Text='<%# Bind("Version") %>'  Width="75"/>
                    </td>
                    <td>
                        <asp:TextBox ID="QuantityTextBox" runat="server" 
                            Text='<%# Bind("Quantity") %>' Width="60" />
                    </td>
                    <td>
                        <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value", "{0:c}") %>' Width="60" />
                    </td>
                    <td>
                        <asp:DropDownList ID="StatusDropDown" runat="server" Text='<%# Bind("Status") %>' Width="100">
                        <asp:ListItem>Due</asp:ListItem>
                        <asp:ListItem>Arrived</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="" align="center">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                 
                    
                    <td>
                        <asp:Label ID="MakeOrPublisherLabel" runat="server" 
                            Text='<%# Eval("MakeOrPublisher") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ModelOrTitleLabel" runat="server" 
                            Text='<%# Eval("ModelOrTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="VersionLabel" runat="server" Text='<%# Eval("Version") %>' />
                    </td>
                    <td>
                        <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ValueLabel" runat="server" Text='<%# Eval("Value") %>' />
                    </td>
                    <td>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="0" style="" width="800">
                                <tr runat="server" style="">
                                    <th runat="server">
                                    </th>
                                  
                                   
                                    <th runat="server">
                                        Publisher</th>
                                    <th runat="server">
                                        Title</th>
                                    <th runat="server">
                                        Version</th>
                                    <th runat="server">
                                        Quantity</th>
                                    <th runat="server">
                                        Value</th>
                                    <th runat="server">
                                        Status</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
          
        </asp:ListView>
    
    </fieldset>
    
    </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Panel>

</asp:Content>

