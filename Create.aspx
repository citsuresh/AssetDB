﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Create.aspx.cs" Inherits="Create" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <asp:SqlDataSource ID="SqlAsset" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            DeleteCommand="usp_DeleteAsset" DeleteCommandType="StoredProcedure" InsertCommand="usp_CreateAsset"
            InsertCommandType="StoredProcedure" SelectCommand="usp_GetAsset" SelectCommandType="StoredProcedure"
            UpdateCommand="usp_UpdateAsset" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="AssetID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AssetType" Type="Int32" />
                <asp:Parameter Name="AssetSubType" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="AltReference" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="DeviceStatus" Type="String" />
                <asp:Parameter Name="HasAlarm" Type="Boolean" />
                <asp:Parameter Name="AlarmMessage" Type="String" />
                <asp:Parameter DbType="Date" Name="StartDate" />
                <asp:Parameter DbType="Date" Name="EndDate" />
                <asp:Parameter Name="Notes" Type="String" />
            </InsertParameters>
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
                <asp:Parameter Name="DeviceStatus" Type="String" />
                <asp:Parameter Name="HasAlarm" Type="Boolean" />
                <asp:Parameter Name="AlarmMessage" Type="String" />
                <asp:Parameter DbType="Date" Name="StartDate" />
                <asp:Parameter DbType="Date" Name="EndDate" />
                <asp:Parameter Name="Notes" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red"></asp:Label>
    </p>
    
       
       
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="AssetID" DataSourceID="SqlAsset"
            DefaultMode="Insert" EnableModelValidation="True" EnableViewState="True" 
            oniteminserting="FormView1_ItemInserting" 
            oniteminserted="FormView1_ItemInserted">
            <InsertItemTemplate>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
            ControlToValidate="AssetTypeDropDownList" ErrorMessage="Asset Type Missing"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="AssetSubTypeDropDownList" ForeColor="Red"
            ErrorMessage="Asset Sub Type Missing"></asp:RequiredFieldValidator>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
            ControlToValidate="StatusDropDownList" ErrorMessage="Status Missing"></asp:RequiredFieldValidator>
                <table class="style1">
                    <tr>
                        <td>
                            Asset Type:</td>
                        <td>
                            <asp:DropDownList ID="AssetTypeDropDownList" runat="server" Width="155px">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="AssetTypeDropDownList_CascadingDropDown" 
                                runat="server" Category="category" Enabled="True" 
                                LoadingText="Loading asset types..." PromptText="[Select Asset Type]" 
                                ServiceMethod="GetAssets" ServicePath="cascadingdataservice.asmx" 
                                TargetControlID="AssetTypeDropDownList">
                            </asp:CascadingDropDown>
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            Asset Sub Type:</td>
                        <td>
                            <asp:DropDownList ID="AssetSubTypeDropDownList" runat="server" Width="155px">
                            </asp:DropDownList>
                            <asp:CascadingDropDown ID="AssetSubTypeDropDownList_CascadingDropDown" 
                                runat="server" Category="category" Enabled="True" 
                                LoadingText="Loading products..." ParentControlID="AssetTypeDropDownList" 
                                PromptText="[Select Sub Type]" ServiceMethod="GetDropDownSubType" 
                                ServicePath="cascadingdataservice.asmx" 
                                TargetControlID="AssetSubTypeDropDownList">
                            </asp:CascadingDropDown>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Name/Serial Number:</td>
                        <td colspan="4">
                            <asp:TextBox ID="NameTextBox" runat="server" MaxLength="50" 
                                Text='<%# Bind("Name") %>' Width="440px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Client Identifier:</td>
                        <td>
                            <asp:TextBox ID="AltReferenceTextBox" runat="server" MaxLength="50"
                                Text='<%# Bind("AltReference") %>' Width="150px" />
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            Status:</td>
                        <td>
                            <asp:DropDownList ID="StatusDropDownList" runat="server"  MaxLength="10" 
                                Text='<%# Bind("Status") %>' Width="155px">
                                <asp:ListItem Selected="True">Active</asp:ListItem>
                                <asp:ListItem>Budgeted</asp:ListItem>
                                <asp:ListItem>In Service</asp:ListItem>
                                <asp:ListItem>Lost</asp:ListItem>
                                <asp:ListItem>Reserved</asp:ListItem>
                                <asp:ListItem>Retired</asp:ListItem>
                                <asp:ListItem>Standby</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Device Status:</td>
                        <td>
                            <asp:TextBox ID="TextBoxDeviceStatus" runat="server" MaxLength="50"
                                         Text='<%# Bind("DeviceStatus") %>' Width="150px" />
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            Alarm Message:</td>
                        <td>
                            <asp:DropDownList ID="HasAlarmDropDown" runat="server" SelectedValue='<%# Bind("HasAlarm") %>'>
                                <asp:ListItem Text="Yes" Value="True" />
                                <asp:ListItem Text="No" Value="False" />
                            </asp:DropDownList>   
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxAlarmMessage" runat="server" MaxLength="50"
                                         Text='<%# Bind("AlarmMessage") %>' Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Service Date:</td>
                        <td>
                            <asp:TextBox ID="StartDateTextBox" runat="server" 
                                Text='<%# Bind("StartDate", "{0:dd-MM-yyyy}") %>' Width="150px" />
                            <asp:CalendarExtender ID="StartDateTextBox_CalendarExtender" runat="server" 
                                Enabled="True" FirstDayOfWeek="Monday" 
                                Format="dd-MM-yyyy" TargetControlID="StartDateTextBox">
                            </asp:CalendarExtender>
                        </td>
                        <td width="25">
                        </td>
                        <td>
                            Next Service Date:</td>
                        <td>
                            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate", "{0:dd-MM-yyyy}") %>' 
                                Width="150px" />
                            <asp:CalendarExtender ID="EndDateTextBox_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="EndDateTextBox" FirstDayOfWeek="Monday" 
                                Format="dd-MM-yyyy">
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
                &nbsp;<br />&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insert" MaxLength="255" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
        </asp:FormView>
    
</asp:Content>
