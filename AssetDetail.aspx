<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AssetDetail.aspx.cs" Inherits="AssetDetail"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="AssetDetailLeft">
    <asp:SqlDataSource ID="SqlAsset" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            DeleteCommand="usp_DeleteAsset" DeleteCommandType="StoredProcedure"
            InsertCommandType="StoredProcedure" SelectCommand="usp_GetAsset" SelectCommandType="StoredProcedure"
            UpdateCommand="usp_UpdateAsset" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="AssetID" Type="Int32" />
            </DeleteParameters>
           
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="AssetID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="AssetID" Type="Int32" />
                <asp:Parameter Name="AssetType" Type="Int32" />
                <asp:Parameter Name="AssetSubType" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="AltReference" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter DbType="Date" Name="StartDate" />
                <asp:Parameter DbType="Date" Name="EndDate" />
                <asp:Parameter Name="Notes" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red"></asp:Label>
        <fieldset>
        <legend>Asset Core Details</legend>
         <asp:Panel ID="Panel3" runat="server">
      
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AssetID" DataSourceID="SqlAsset"
            DefaultMode="ReadOnly" EnableModelValidation="True" EnableViewState="True" 
                Font-Names="Tahoma" Font-Size="Medium" 
            >
            <EditItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            Asset Type:</td>
                        <td>
                        <asp:textbox ID="AssetTypeTextBox" runat="server" Width="150px" 
                        Text='<%# Eval("AssetType") %>' ReadOnly="True"></asp:textbox>
                           
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            Asset Sub Type:</td>
                        <td>
                            <asp:TextBox ID="AssetSubTypeTextBox" runat="server" Width="150px"
                            Text='<%# Eval("AssetSubType") %>' ReadOnly="True"></asp:TextBox>
                           
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Name:</td>
                        <td colspan="4">
                            <asp:TextBox ID="NameTextBox" runat="server" MaxLength="50" 
                                Text='<%# Bind("Name") %>' Width="440px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Call Ref:</td>
                        <td>
                            <asp:TextBox ID="AltReferenceTextBox" runat="server" MaxLength="50"
                                Text='<%# Bind("AltReference") %>' Width="150px" />
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            Status:</td>
                        <td>
                            <asp:DropDownList ID="StatusDropDownList" runat="server"  MaxLength="15"
                                Text='<%# Bind("Status") %>' Width="155px">
                                <asp:ListItem>Live</asp:ListItem>
                                <asp:ListItem>Test</asp:ListItem>
                                <asp:ListItem>Retired</asp:ListItem>
                                <asp:ListItem>Planned</asp:ListItem>
                                <asp:ListItem Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Start Date:</td>
                        <td>
                            <asp:TextBox ID="StartDateTextBox" runat="server" 
                                Text='<%# Bind("StartDate") %>' Width="150px" />
                                <asp:CalendarExtender ID="StartDateTextBox_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="EndDateTextBox" FirstDayOfWeek="Monday" 
                                Format="dd/MM/yyyy">
                            </asp:CalendarExtender>
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            End Date:</td>
                        <td>
                            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' 
                                Width="150px" />
                                <asp:CalendarExtender ID="EndDateTextBox_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="EndDateTextBox" FirstDayOfWeek="Monday" 
                                Format="dd/MM/yyyy">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Notes:</td>
                        <td colspan="4">
                            <asp:TextBox ID="NotesTextBox" runat="server" MaxLength="255" Rows="3" 
                                Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="440px" />
                        </td>
                    </tr>
                </table>
                &nbsp;<br />&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" MaxLength="255" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <ItemTemplate>
                 <table class="style1" style="padding: 5px; border-spacing: 5px">
                    <tr>
                        <td>
                            Asset Type:</td>
                        <td>
                        <asp:Label ID="AssetTypeLabel" runat="server" 
                        Text='<%# Eval("AssetType") %>' ForeColor="Black" />
                           
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            Asset Sub Type:</td>
                        <td>
                            <asp:Label ID="AssetSubTypeLabel" runat="server"
                            Text='<%# Eval("AssetSubType") %>' ForeColor="Black" />
                           
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Name:</td>
                        <td colspan="4">
                            <asp:Label ID="NameLabel" runat="server" 
                                Text='<%# Bind("Name") %>' ForeColor="Black" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Call Ref:</td>
                        <td>
                            <asp:Label ID="AltReferenceLabel" runat="server" 
                                Text='<%# Bind("AltReference") %>' ForeColor="Black"/>
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            Status:</td>
                        <td>
                            <asp:Label ID="StatusLabel" runat="server" 
                                Text='<%# Bind("Status") %>' ForeColor="Black" />
                                
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Start Date:</td>
                        <td>
                            <asp:Label ID="StartDateLabel" runat="server" 
                                Text='<%# Bind("StartDate") %>' ForeColor="Black"/>
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            End Date:</td>
                        <td>
                            <asp:Label ID="EndDateLabel" runat="server" Text='<%# Bind("EndDate") %>' ForeColor="Black" 
                                />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Notes:</td>
                        <td colspan="4">
                            <asp:Label ID="NotesLabel" runat="server" Rows="3" 
                                Text='<%# Bind("Notes") %>' ForeColor="Black" />
                        </td>
                    </tr>
                </table>
                &nbsp;<br />&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Edit"
                    Text="Edit" MaxLength="255" />
              
            </ItemTemplate>

        </asp:FormView>
        </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>
        </fieldset>

                <fieldset>
        <legend>Asset Type Details</legend>
        <asp:Panel ID="Panel1" runat="server">
      
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                <asp:SqlDataSource ID="SqlAssetTypePropertyValues" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
                    SelectCommand="usp_GetAssetTypeValues" SelectCommandType="StoredProcedure" 
                    UpdateCommand="usp_UpdateAssetTypeValues" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Asset" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AssetTypePropertyValueID" Type="Int32" />
                        <asp:Parameter Name="AssetTypePropertyValue" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="AssetTypePropertyValueID" ShowFooter="True"
                    DataSourceID="SqlAssetTypePropertyValues" GridLines="None" 
                    onrowdatabound="GridView1_RowDataBound">
                    <RowStyle Font-Names="Tahoma" Font-Size="Medium" />
                    <HeaderStyle Font-Names="Tahoma" Font-Size="Medium" Width="150px" />
                    <Columns>
                        <asp:TemplateField HeaderText="AssetTypePropertyValueID" InsertVisible="False" 
                            SortExpression="AssetTypePropertyValueID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" 
                                    Text='<%# Bind("AssetTypePropertyValueID") %>'></asp:Label>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        <asp:BoundField DataField="AssetTypeProperty" 
                            SortExpression="AssetTypeProperty"/>
                        <asp:BoundField DataField="AssetTypePropertyID" 
                            SortExpression="AssetTypePropertyID" ShowHeader="False" >
                        <ControlStyle Width="0px" />
                        <FooterStyle Width="0px" />
                        <HeaderStyle Width="0px" />
                        <ItemStyle ForeColor="White" Width="0px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Value" SortExpression="AssetTypePropertyValue">
                            <ItemTemplate>
                                <asp:TextBox ID="AssetTypePropertyValueTextBox" runat="server" MaxLength="50"
                                    Text='<%# Bind("AssetTypePropertyValue") %>' AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="AssetTypePropertyValueTextBox_AutoCompleteExtender" 
                                    runat="server" ContextKey="" DelimiterCharacters="" Enabled="True" 
                                    MinimumPrefixLength="1" ServiceMethod="getTypeLookupValues" ServicePath="" 
                                    TargetControlID="AssetTypePropertyValueTextBox" UseContextKey="True"
                                    CompletionInterval="250"  >
                                    <Animations>
                                    <OnShow>
                                         <Sequence>
                                            <OpacityAction Opacity="0" />
                                            <HideAction Visible="true" />
                                            <Parallel Duration=".4">
                                             <FadeIn />
                                             </Parallel>
                                            </Sequence>
                                     </OnShow>
                                      <OnHide>
                                        <Parallel Duration=".4">
                                            <FadeOut />
                                      </Parallel>
                                  </OnHide>
                                        </Animations>
                                </asp:AutoCompleteExtender>
                            </ItemTemplate>
                             <FooterTemplate>
                            <div align="right">
                                <asp:Button ID="UpdateButton" runat="server" 
                                    Text="Update" onclick="UpdateButton_Click" />
                               
                                <asp:ConfirmButtonExtender ID="UpdateButton_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="Please confirm changes" Enabled="True" TargetControlID="UpdateButton" OnClientCancel="onCancel">
                                </asp:ConfirmButtonExtender>
                               
                            </div>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                
              
            </ContentTemplate>
          
        </asp:UpdatePanel>
        </asp:Panel>
        </fieldset>

        <fieldset>
        <legend>Asset Sub Type Details</legend>
        <asp:Panel ID="Panel2" runat="server">
      
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                
                <asp:SqlDataSource ID="SqlAssetSubTypePropertyValues" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
                    SelectCommand="usp_GetAssetSubTypeValues" SelectCommandType="StoredProcedure" 
                    UpdateCommand="usp_UpdateAssetSubTypeValues" 
                    UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Asset" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AssetSubTypePropertyValueID" Type="Int32" />
                        <asp:Parameter Name="AssetSubTypePropertyValue" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="3"  DataKeyNames="AssetSubTypePropertyValueID" 
                    DataSourceID="SqlAssetSubTypePropertyValues" GridLines="None" 
                    ShowFooter="True" onrowdatabound="GridView2_RowDataBound">
                    <RowStyle Font-Names="Tahoma" Font-Size="Medium" />
                    <Columns>
                        <asp:TemplateField HeaderText="AssetSubTypePropertyValueID" Visible="False" 
                            SortExpression="AssetSubTypePropertyValueID">
                            
                            <ItemTemplate>
                                <asp:Label ID="AssetSubTypePropertyValueIDLabel" runat="server" MaxLength="50"
                                    Text='<%# Bind("AssetSubTypePropertyValueID") %>' Visible="False"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="AssetSubTypeProperty"/>


                       
                        <asp:BoundField DataField="AssetSubTypePropertyID" ShowHeader="False">
                        <ControlStyle Width="0px" />
                        <FooterStyle Width="0px" />
                        <HeaderStyle Width="0px" />
                        <ItemStyle ForeColor="White" />
                        </asp:BoundField>
                       
                       <asp:TemplateField HeaderText="Value" SortExpression="AssetSubTypePropertyValue">
                            
                            <ItemTemplate>
                                <asp:TextBox ID="AssetSubTypePropertyValueTextBox" runat="server" 
                                    Text='<%# Bind("AssetSubTypePropertyValue") %>' AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:AutoCompleteExtender ID="AssetSubTypePropertyValueTextBox_AutoCompleteExtender" 
                                    runat="server" DelimiterCharacters="" Enabled="True" ServicePath="" 
                                    TargetControlID="AssetSubTypePropertyValueTextBox" MinimumPrefixLength="1"
                                    ServiceMethod="getSubTypeLookupValues" UseContextKey="True" ContextKey="" 
                                     CompletionInterval="250"  >
                                    <Animations>
                                    <OnShow>
                                         <Sequence>
                                            <OpacityAction Opacity="0" />
                                            <HideAction Visible="true" />
                                            <Parallel Duration=".4">
                                             <FadeIn />
                                             </Parallel>
                                            </Sequence>
                                     </OnShow>
                                      <OnHide>
                                        <Parallel Duration=".4">
                                            <FadeOut />
                                      </Parallel>
                                  </OnHide>
                                        </Animations>

                                    
                                </asp:AutoCompleteExtender>
                            </ItemTemplate>
                            <FooterTemplate>
                            <div align="right">
                                <asp:Button ID="UpdateSubButton" runat="server" 
                                    Text="Update" onclick="UpdateSubButton_Click" />
                               
                                <asp:ConfirmButtonExtender ID="UpdateSubButton_ConfirmButtonExtender" 
                                    runat="server" ConfirmText="Please confirm changes" Enabled="True" TargetControlID="UpdateSubButton" OnClientCancel="onCancel">
                                </asp:ConfirmButtonExtender>
                               
                            </div>
                            </FooterTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                   
                    <HeaderStyle Font-Names="Tahoma" Font-Size="Medium" Width="150px" />
                </asp:GridView>
                
              
            </ContentTemplate>
          
        </asp:UpdatePanel>
        </asp:Panel>
        </fieldset>


    <asp:Panel ID="Panel4" runat="server">
     <fieldset>
        <legend>Attachments</legend>

           <asp:Label ID="LabelErr" runat="server" ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSourceDocs" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
                DeleteCommand="usp_DocumentsDelete" DeleteCommandType="StoredProcedure" 
                SelectCommand="usp_DocumentsSelect" SelectCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="AssetID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>   
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="ID" DataSourceID="SqlDataSourceDocs" 
                onselectedindexchanged="GridView3_SelectedIndexChanged" 
             CssClass="DocList">
                <Columns>
                    <asp:CommandField SelectText="Open" ShowDeleteButton="True" 
                        ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="DateUploaded" HeaderText="Date Uploaded" 
                        SortExpression="DateUploaded" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <RowStyle CssClass="DocList" />
            </asp:GridView>
                    <asp:LinkButton ID="LinkButtonUpload" runat="server">Upload Document</asp:LinkButton>  
            <asp:Panel ID="UploadPanel" runat="server" BackColor="#CCFFFF" BorderColor="#6699FF" BorderStyle="Outset" Width="350" Height="150">

&nbsp;&nbsp;Please enter a title and select a file to upload
            <br />
            
<br />
  <table class="UploadTable">
        <tr>
            <td>
   
   
   <b>&nbsp;Title:</b>
            </td>
            <td width="200">
<asp:TextBox ID="DocumentTitle" runat="server" />
    
    
            </td>

        </tr>
        <tr>
            <td>
<b>&nbsp;File:</b></td>
            <td width="200">
<asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
      
        </tr>
    </table>

&nbsp;&nbsp;
<asp:LinkButton ID="LinkButton1" runat="server" Text="Insert" onclick="LinkButton1_Click" 
        />&nbsp;&nbsp;
<asp:LinkButton ID="LinkButton2" runat="server" Text="Cancel" onclick="LinkButton2_Click" />  
        

        

        
        
        

        </asp:Panel>   
        
          
            <asp:PopupControlExtender ID="UpdatePanel5_PopupControlExtender" runat="server" 
                DynamicServicePath="" Enabled="True" ExtenderControlID="" 
                TargetControlID="LinkButtonUpload" Position="Top" OffsetY="-100"
                PopupControlID="UploadPanel">
            </asp:PopupControlExtender>
             </fieldset>
    </asp:Panel>
    </div>

    <div id="AssetDetailRight">
    <Panel>

    
    
    

        <fieldset>
        <legend>Create Relationship</legend>
        <UpdatePanel>
        <ContentTemplate>
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
    
        <table class="style1">
             <tr>
              <td>
                     Name: </td>
                 <td>
        <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
    
    
                 </td>
                 </tr>
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
                </tr>
                <tr>
                 <td>
                     Sub Type: </td>
                 <td>
        <asp:DropDownList ID="AssetSubTypeDropDownList" runat="server" Width="155px" 
                         AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlAssetSubType" 
                         DataTextField="AssetSubType" DataValueField="AssetSubType">
            <asp:ListItem Selected="True" Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                        <asp:Button ID="SearchButton" runat="server" Text="Filter" />
                 </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
             </tr>
                <tr>
                
                 <td colspan="2">Select Asset from drop down list below to link.</td>
             </tr>
                <tr>
                
                 <td>
                     Asset:</td>
                 <td>







            <asp:DropDownList ID="DropDownListRelatedAsset" runat="server" 
                DataSourceID="SqlAssets" DataTextField="Name" 
                DataValueField="AssetID" Width="155px" AppendDataBoundItems="True">
                <asp:ListItem Selected="True" Value="">Please Select</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="AddButton" runat="server" Text="Add" onclick="AddButton_Click" />

            </ContentTemplate>
            </updatepanel>





                    </td>
             </tr>
        </table>



        </fieldset>
        <br />
       
     <fieldset>
        <legend>Existing Relationships</legend>


        
        

        <asp:TreeView ID="TreeView1" runat="server" ExpandDepth="2" 
        ontreenodepopulate="TreeView1_TreeNodePopulate" ImageSet="Arrows" 
             ShowLines="True" ontreenodecheckchanged="TreeView1_TreeNodeCheckChanged" 
             ShowCheckBoxes="All" LineImagesFolder="~/Images">
            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
                HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                HorizontalPadding="0px" VerticalPadding="0px" />
        </asp:TreeView>
        
        
        <br />
        
         <asp:LinkButton ID="LinkButtonDelete" runat="server" 
             onclick="LinkButtonDelete_Click">Unlink Checked Items</asp:LinkButton>
        
        
        
        
        </fieldset>

    </panel>
    </div>
</asp:Content>

