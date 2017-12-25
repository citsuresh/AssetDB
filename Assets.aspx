<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Assets.aspx.cs" Inherits="Assets" %>

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
    <asp:SqlDataSource ID="SqlAssets" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        SelectCommand="usp_GetAssets" SelectCommandType="StoredProcedure" 
        CacheDuration="5" EnableCaching="True"
         FilterExpression="(AssetType Like '%{0}%' and AssetSubType Like '%{1}%' and Name Like '%{2}%')" >
        <FilterParameters>
            <asp:ControlParameter ControlID="AssetTypeDropDownList" DefaultValue="%" 
                Name="FilterDropDownList1" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="AssetSubTypeDropDownList" DefaultValue="%" 
                Name="FilterDropDownList2" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="%" 
                Name="FilterTextBox1" PropertyName="Text" ConvertEmptyStringToNull="False" />
        </FilterParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlAssetType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        SelectCommand="usp_LookupAssetType" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlAssetSubType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        SelectCommand="usp_LookupAssetSubTypebyName" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="AssetTypeDropDownList" Name="AssetType" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Panel ID="Panel1" runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
       

    <fieldset>
    <legend>Filter</legend>
    
    
         <table class="style1">
             <tr>
                 <td>
                     Type: </td>
                 <td>
    
    
         <asp:DropDownList ID="AssetTypeDropDownList" runat="server" Width="155px" 
                         AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlAssetType" 
                         DataTextField="AssetType" DataValueField="AssetType" 
                         onselectedindexchanged="AssetTypeDropDownList_SelectedIndexChanged">
             <asp:ListItem Selected="True" Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                        
                </td>
                 <td>
                     Sub Type: </td>
                 <td>
        <asp:DropDownList ID="AssetSubTypeDropDownList" runat="server" Width="155px" 
                         AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlAssetSubType" 
                         DataTextField="AssetSubType" DataValueField="AssetSubType">
            <asp:ListItem Selected="True" Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                       
                 </td>
                 <td>
                     Name: </td>
                 <td>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    
                 </td>
                 <td>
                     &nbsp;</td>
                 <td>
                     &nbsp;</td>
                 <td>
                    <asp:Button ID="SearchButton" runat="server" Text="Filter" /></td>
             </tr>
        </table>
    
    
    </fieldset>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="AssetID" DataSourceID="SqlAssets" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center" Width="920px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        onrowdatabound="GridView1_RowDataBound" PageSize="20">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True">
            <ControlStyle CssClass="HiddenColumn" />
            <FooterStyle CssClass="HiddenColumn" />
            <HeaderStyle CssClass="HiddenColumn" />
            <ItemStyle CssClass="HiddenColumn" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" 
                SortExpression="AssetID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("AssetID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="AssetID_LinkButton" runat="server" 
                        Text='<%# Eval("AssetID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="AssetType" HeaderText="Type" 
                SortExpression="AssetType" />
            <asp:BoundField DataField="AssetSubType" HeaderText="Sub Type" 
                SortExpression="AssetSubType" />
             <asp:BoundField DataField="Name" HeaderText="Name/Serial Number" 
                SortExpression="Name" />
            <asp:BoundField DataField="LabID" HeaderText="Lab Identifier" 
                SortExpression="LabID" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="NextServiceDate" DataFormatString="{0:d}" 
                HeaderText="Next Service Date" SortExpression="NextServiceDate" />
           
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NextPreviousFirstLast" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
     </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>




</asp:Content>

