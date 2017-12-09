<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssetConfig.aspx.cs" Inherits="AssetConfig" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:SqlDataSource ID="SQLAssetType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        DeleteCommand="usp_DeleteAssetType" DeleteCommandType="StoredProcedure" 
        InsertCommand="usp_CreateAssetType" InsertCommandType="StoredProcedure" 
        SelectCommand="usp_GetAssetType" SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_UpdateAssetType" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="AssetTypeID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AssetTypeID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="AssetTypeID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlAssetTypeProperty" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        DeleteCommand="usp_DeleteAssetTypeProperty" DeleteCommandType="StoredProcedure" 
        InsertCommand="usp_CreateAssetTypeProperty" InsertCommandType="StoredProcedure" 
        SelectCommand="usp_GetAssetTypeProperty" SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_UpdateAssetTypeProperty" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="AssetTypePropertyID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="Int32" />
            <asp:Parameter Name="AssetTypeProperty" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AssetTypePropertyID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="Int32" />
            <asp:Parameter Name="AssetTypeProperty" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ListView1" Name="AssetType" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AssetTypePropertyID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="Int32" />
            <asp:Parameter Name="AssetTypeProperty" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlAssetTypePropertyValueLookup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        DeleteCommand="usp_AssetTypePropertyValueLookupDelete" 
        DeleteCommandType="StoredProcedure" 
        InsertCommand="usp_AssetTypePropertyValueLookupInsert" 
        InsertCommandType="StoredProcedure" 
        SelectCommand="usp_AssetTypePropertyValueLookupSelect" 
        SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_AssetTypePropertyValueLookupUpdate" 
        UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="LookupID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PropertyType" Type="Int32" />
            <asp:Parameter Name="LookupValue" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ListView2" Name="PropertyType" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LookupID" Type="Int32" />
            <asp:Parameter Name="PropertyType" Type="Int32" />
            <asp:Parameter Name="LookupValue" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlAssetSubType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        DeleteCommand="usp_DeleteAssetSubType" DeleteCommandType="StoredProcedure" 
        InsertCommand="usp_CreateAssetSubType" InsertCommandType="StoredProcedure" 
        SelectCommand="usp_GetAssetSubType" SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_UpdateAssetSubType" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="AssetSubTypeID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="Int32" />
            <asp:Parameter Name="AssetSubType" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AssetSubTypeID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="Int32" />
            <asp:Parameter Name="AssetSubType" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ListView1" Name="AssetType" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AssetSubTypeID" Type="Int32" />
            <asp:Parameter Name="AssetType" Type="Int32" />
            <asp:Parameter Name="AssetSubType" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlAssetSubTypeProperty" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        DeleteCommand="usp_DeleteAssetSubTypeProperty" 
        DeleteCommandType="StoredProcedure" 
        InsertCommand="usp_CreateAssetSubTypeProperty" 
        InsertCommandType="StoredProcedure" SelectCommand="usp_GetAssetSubTypeProperty" 
        SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_UpdateAssetSubTypeProperty" 
        UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="AssetSubTypePropertyID" Type="Int32" />
            <asp:Parameter Name="AssetSubType" Type="Int32" />
            <asp:Parameter Name="AssetSubTypeProperty" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AssetSubTypePropertyID" Type="Int32" />
            <asp:Parameter Name="AssetSubType" Type="Int32" />
            <asp:Parameter Name="AssetSubTypeProperty" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ListView3" Name="AssetSubType" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AssetSubTypePropertyID" Type="Int32" />
            <asp:Parameter Name="AssetSubType" Type="Int32" />
            <asp:Parameter Name="AssetSubTypeProperty" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="SqlAssetSubTypePropertyValueLookup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
        DeleteCommand="usp_AssetSubTypePropertyValueLookupDelete" 
        DeleteCommandType="StoredProcedure" 
        InsertCommand="usp_AssetSubTypePropertyValueLookupInsert" 
        InsertCommandType="StoredProcedure" 
        SelectCommand="usp_AssetSubTypePropertyValueLookupSelect" 
        SelectCommandType="StoredProcedure" 
        UpdateCommand="usp_AssetSubTypePropertyValueLookupUpdate" 
        UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="LookupID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="PropertySubType" Type="Int32" />
            <asp:Parameter Name="LookupValue" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ListView4" Name="PropertySubType" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LookupID" Type="Int32" />
            <asp:Parameter Name="PropertySubType" Type="Int32" />
            <asp:Parameter Name="LookupValue" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <div class="container">
   
   
    <div class="leftside">
    <fieldset>
    <legend style="font-size: large">Asset Types</legend>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="AssetTypeID" 
        DataSourceID="SQLAssetType" InsertItemPosition="LastItem" 
            onselectedindexchanged="ListView1_SelectedIndexChanged">
       
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
               
                <td>
                    <asp:TextBox ID="AssetTypeTextBox" runat="server" 
                        Text='<%# Bind("AssetType") %>' width="105"/>
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
                    <asp:TextBox ID="AssetTypeTextBox" runat="server" 
                        Text='<%# Bind("AssetType") %>' width="105" />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                    
                </td>
               
                
                <td>
                    <asp:LinkButton ID="AssetTypeLinkButton" runat="server" Text='<%# Eval("AssetType") %>' CommandName="Select" />
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
                                    </th>
                            </tr>
                            <tr runat="server" ID="itemPlaceholder">
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
        <SelectedItemTemplate>
            <tr style="">
               
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                        Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                </td>
                
               
                <td>
                    <span>
                    <asp:Label ID="AssetTypeLabel" runat="server" Text='<%# Eval("AssetType") %>' Font-Size="Larger" Font-Bold="True" />
                    </span>
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    </ContentTemplate>
    </asp:UpdatePanel>
    </fieldset>
    </div>
    
    <div class="middle">
    <fieldset>
    <legend style="font-size: large">Asset Type Properties</legend>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
     <ContentTemplate>

        <asp:Label ID="AssetTypePropertyMessage" runat="server" Text="No asset type selected."></asp:Label>
        
         
         <asp:ListView ID="ListView2" runat="server" DataKeyNames="AssetTypePropertyID" 
            DataSourceID="SqlAssetTypeProperty" InsertItemPosition="LastItem" 
            oniteminserting="ListView2_ItemInserting" 
             onselectedindexchanged="ListView2_SelectedIndexChanged">
           <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                   
                    
                    <td>
                        <asp:TextBox ID="AssetTypePropertyTextBox" runat="server" 
                            Text='<%# Bind("AssetTypeProperty") %>' width="105"/>
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
                        <asp:TextBox ID="AssetTypePropertyTextBox" runat="server" 
                            Text='<%# Bind("AssetTypeProperty") %>' width="105"/>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                    </td>
                   
                    <td>
                        <asp:LinkButton ID="AssetTypePropertyLabel" runat="server" 
                            Text='<%# Eval("AssetTypeProperty") %>'  CommandName="Select"/>
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
                                       </th>
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
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                    </td>
                   
                    <td>
                        <asp:Label ID="AssetTypePropertyLabel" runat="server" 
                            Text='<%# Eval("AssetTypeProperty") %>'  Font-Size="Larger" Font-Bold="True" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
        </fieldset>
    </div>

    <div class="rightside">
    <fieldset>
    <legend style="font-size: large">Type Property Lookups</legend>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
     <ContentTemplate>
    <asp:Label ID="AssetTypePropertyValueLookupMessage" runat="server" Text="No asset type property selected."></asp:Label>
        <asp:ListView ID="ListView5" runat="server" 
            DataSourceID="SqlAssetTypePropertyValueLookup" DataKeyNames="LookupID" 
            InsertItemPosition="LastItem" oniteminserting="ListView5_ItemInserting">
          
          
          
           
          
          
            <EditItemTemplate>
                <tr style="">
                   
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                   
                   
                    <td>
                        <asp:TextBox ID="LookupValueTextBox" runat="server" 
                            Text='<%# Bind("LookupValue") %>' width="105"/>
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
                        <asp:TextBox ID="LookupValueTextBox" runat="server" 
                            Text='<%# Bind("LookupValue") %>' width="105"/>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                   
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                    </td>
                   
                   
                    <td>
                        <asp:Label ID="LookupValueLabel" runat="server" 
                            Text='<%# Eval("LookupValue") %>' />
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
                                        </th>
                                </tr>
                                <tr runat="server" ID="itemPlaceholder">
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
         </ContentTemplate>
    </asp:UpdatePanel>
    
    
    
    </fieldset>
    </div>


    <div class="clear"></div>
    <div class="leftside">
    <fieldset>
    <legend style="font-size: large">Asset Sub Type</legend>
     <asp:UpdatePanel ID="UpdatePanel3" runat="server">
     <ContentTemplate>   
    <asp:Label ID="AssetSubTypeMessage" runat="server" Text="No asset type selected."></asp:Label>
        <asp:ListView ID="ListView3" runat="server" DataKeyNames="AssetSubTypeID" 
            DataSourceID="SqlAssetSubType" InsertItemPosition="LastItem" 
            oniteminserting="ListView3_ItemInserting" 
            onselectedindexchanged="ListView3_SelectedIndexChanged">
            
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                   
                    <td>
                        <asp:TextBox ID="AssetSubTypeTextBox" runat="server" 
                            Text='<%# Bind("AssetSubType") %>' width="105"/>
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
                        <asp:TextBox ID="AssetSubTypeTextBox" runat="server" 
                            Text='<%# Bind("AssetSubType") %>' width="105"/>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                    </td>
                  
                    <td>
                        <asp:LinkButton ID="AssetSubTypeLinkButton" runat="server" 
                            Text='<%# Eval("AssetSubType") %>' CommandName="Select" />
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
                                        </th>
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
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                    </td>
                   
                    <td>
                        <asp:Label ID="AssetSubTypeLabel" runat="server" 
                            Text='<%# Eval("AssetSubType") %>' Font-Size="Larger" Font-Bold="True" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
     </ContentTemplate>
    </asp:UpdatePanel>
    
    </fieldset>
    </div>

    <div class="middle">
    <fieldset>
    <legend style="font-size: large">Asset Sub Type Properties</legend>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
     <ContentTemplate>
    <asp:Label ID="AssetSubTypePropertyMessage" runat="server" Text="No asset sub type selected."></asp:Label>
        <asp:ListView ID="ListView4" runat="server" 
            DataSourceID="SqlAssetSubTypeProperty" DataKeyNames="AssetSubTypePropertyID" 
            InsertItemPosition="LastItem" oniteminserting="ListView4_ItemInserting" 
             onselectedindexchanged="ListView4_SelectedIndexChanged">
          
          
          
            <EditItemTemplate>
                <tr style="">
                   
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                   
                    <td>
                        <asp:TextBox ID="AssetSubTypePropertyTextBox" runat="server" 
                            Text='<%# Bind("AssetSubTypeProperty") %>' width="105"/>
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
                        <asp:TextBox ID="AssetSubTypePropertyTextBox" runat="server" 
                            Text='<%# Bind("AssetSubTypeProperty") %>' width="105"/>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                   
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                    </td>
                   
                    <td>
                        <asp:LinkButton ID="AssetSubTypePropertyLabel" runat="server" 
                            Text='<%# Eval("AssetSubTypeProperty") %>'  CommandName="Select"/>
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
                                        </th>
                                </tr>
                                <tr runat="server" ID="itemPlaceholder">
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
            <SelectedItemTemplate>
                <tr style="">
                   
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Rename" />
                    </td>
                   
                    <td>
                        <asp:Label ID="AssetSubTypePropertyLabel" runat="server" 
                            Text='<%# Eval("AssetSubTypeProperty") %>'  Font-Size="Larger" Font-Bold="True" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
         </ContentTemplate>
    </asp:UpdatePanel>
    
    
    
    </fieldset>
    </div>
     <div class="rightside">
    <fieldset>
    <legend style="font-size: large">Sub Type Property Lookups</legend>
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
     <ContentTemplate>
    <asp:Label ID="AssetSubTypePropertyValueLookupMessage" runat="server" Text="No asset sub type Property selected."></asp:Label>
        <asp:ListView ID="ListView6" runat="server" 
            DataSourceID="SqlAssetSubTypePropertyValueLookup" DataKeyNames="LookupID" 
            InsertItemPosition="LastItem" oniteminserting="ListView6_ItemInserting">
          
          
          
          
          
          
          
            <EditItemTemplate>
                <tr style="">
                   
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Rename" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                   
                   
                    <td>
                        <asp:TextBox ID="LookupValueTextBox" runat="server" 
                            Text='<%# Bind("LookupValue") %>' width="105"/>
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
                        <asp:TextBox ID="LookupValueTextBox" runat="server" 
                            Text='<%# Bind("LookupValue") %>' width="105" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                   
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                   
                   
                    <td>
                        <asp:Label ID="LookupValueLabel" runat="server" 
                            Text='<%# Eval("LookupValue") %>' />
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
                                       </th>
                                </tr>
                                <tr runat="server" ID="itemPlaceholder">
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
         </ContentTemplate>
    </asp:UpdatePanel>
    
    
    
    </fieldset>
    </div>
    </div>
</asp:Content>

