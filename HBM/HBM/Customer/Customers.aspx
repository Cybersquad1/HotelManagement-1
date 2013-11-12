﻿<%@ Page Title="" Language="C#" MasterPageFile="~/HBMMaster.Master" AutoEventWireup="true"
    CodeBehind="Customers.aspx.cs" Inherits="HBM.Customers" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ MasterType VirtualPath="~/HBMMaster.Master" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper-inner">
        <h2>
            Add Customer</h2>
        <table class="customers-tbl">
            <tr>
                <td height="22" class="info-lbl">
                    Customer Name<span class="reqfield">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtCustomerName" runat="server" Width="170px" TabIndex="1">
                        <ValidationSettings Display="Dynamic" EnableCustomValidation="True" ValidationGroup="vgCustomer"
                            ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="True" ErrorText="Required" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    Passport Number
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtPassportNumber" runat="server" Width="170px" TabIndex="15">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Member Code<span class="reqfield">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtMemberCode" runat="server" Width="170px" TabIndex="1">
                        <ValidationSettings Display="Dynamic" EnableCustomValidation="True" ValidationGroup="vgCustomer"
                            ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="True" ErrorText="Required" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    Country of Issue
                </td>
                <td>
                    <dx:ASPxComboBox ID="cmbPassportCountryOfIssue" runat="server" ValueType="System.Int32"
                        IncrementalFilteringMode="Contains" TabIndex="16">
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Gender<span class="reqfield">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cmbGender" runat="server" IncrementalFilteringMode="Contains"
                        TabIndex="2">
                        <Items>
                            <dx:ListEditItem Text="Male" Value="Male" />
                            <dx:ListEditItem Text="Female" Value="Female" />
                        </Items>
                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" ValidationGroup="vgCustomer">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    Expiry Date
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dtpExpiryDate" runat="server" TabIndex="17">
                    </dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Phone<span class="reqfield">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtPhone" runat="server" Width="170px" TabIndex="3">
                        <ValidationSettings Display="Dynamic" EnableCustomValidation="True" SetFocusOnError="True"
                            ValidationGroup="vgCustomer" ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="True" ErrorText="Required" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Fax
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtFax" runat="server" Width="170px" TabIndex="4">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    CC Type
                </td>
                <td>
                    <dx:ASPxComboBox ID="cmbCCType" runat="server" IncrementalFilteringMode="Contains"
                        ValueType="System.Int32" TabIndex="18">
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Email
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtEmail" runat="server" Width="170px" TabIndex="5">
                        <ValidationSettings Display="Dynamic" EnableCustomValidation="True" ErrorDisplayMode="ImageWithTooltip"
                            SetFocusOnError="True" ValidationGroup="vgCustomer">
                            <RegularExpression ErrorText="Incorrect Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    CC No
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtCCNumber" runat="server" Width="170px" TabIndex="19">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Guest Type<span class="reqfield">*</span>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cmbGuestType" runat="server" ValueType="System.Int32" DropDownStyle="DropDown"
                        TabIndex="6">
                        <ClientSideEvents ButtonClick="function(s, e) {
  	ShowPopupWindow(ppcGuestType);
}" />
                        <Buttons>
                            <dx:EditButton Position="Left" ToolTip="Add/Edit guest type">
                            </dx:EditButton>
                        </Buttons>
                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidationGroup="vgCustomer"
                            Display="Dynamic">
                            <RequiredField ErrorText="Required" IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    CC Expiry Date (mm/yyyy)
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxComboBox ID="cmbCCExpiryDateMonth" runat="server" ValueType="System.Int32"
                                    IncrementalFilteringMode="Contains" Width="50px" TabIndex="20">
                                    <Items>
                                        <dx:ListEditItem Text="1" Value="1" />
                                        <dx:ListEditItem Text="2" Value="2" />
                                        <dx:ListEditItem Text="3" Value="3" />
                                        <dx:ListEditItem Text="4" Value="4" />
                                        <dx:ListEditItem Text="5" Value="5" />
                                        <dx:ListEditItem Text="6" Value="6" />
                                        <dx:ListEditItem Text="7" Value="7" />
                                        <dx:ListEditItem Text="8" Value="8" />
                                        <dx:ListEditItem Text="9" Value="9" />
                                        <dx:ListEditItem Text="10" Value="10" />
                                        <dx:ListEditItem Text="11" Value="11" />
                                        <dx:ListEditItem Text="12" Value="12" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                                /
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cmbCCExpiryDateYear" runat="server" ValueType="System.Int32"
                                    IncrementalFilteringMode="Contains" Width="114px" TabIndex="21">
                                    <Items>
                                        <dx:ListEditItem Text="2012" Value="2012" />
                                        <dx:ListEditItem Text="2013" Value="2013" />
                                        <dx:ListEditItem Text="2014" Value="2014" />
                                        <dx:ListEditItem Text="2015" Value="2015" />
                                        <dx:ListEditItem Text="2016" Value="2016" />
                                        <dx:ListEditItem Text="2017" Value="2017" />
                                        <dx:ListEditItem Text="2018" Value="2018" />
                                        <dx:ListEditItem Text="2019" Value="2019" />
                                        <dx:ListEditItem Text="2020" Value="2020" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Company Name
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtCompanyName" runat="server" Width="170px" TabIndex="7">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    Name on card
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNameOnCard" runat="server" Width="170px" TabIndex="22">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Company Address
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtCompanyAddress" runat="server" Width="170px" TabIndex="8">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Notes
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNotes" runat="server" Width="170px" TabIndex="9">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    Car
                </td>
                <td>
                    <dx:ASPxComboBox ID="cmbCar" runat="server" AnimationType="Fade" IncrementalFilteringMode="Contains"
                        TabIndex="23">
                        <Items>
                            <dx:ListEditItem Text="No" Value="No" />
                            <dx:ListEditItem Text="Yes" Value="Yes" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    License Plate
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtLicensePlate" runat="server" Width="170px" TabIndex="24">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Billing Address<span class="reqfield">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtBillingAddress" runat="server" Width="170px" TabIndex="10">
                        <ValidationSettings Display="Dynamic" EnableCustomValidation="True" ValidationGroup="vgCustomer"
                            ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="True" ErrorText="Required" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td class="info-lbl">
                    Drive License
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtDriveLicense" runat="server" Width="170px" TabIndex="25">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Billing City<span class="reqfield">*</span>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtBillingCity" runat="server" Width="170px" TabIndex="11">
                        <ValidationSettings Display="Dynamic" EnableCustomValidation="True" ValidationGroup="vgCustomer"
                            ErrorDisplayMode="ImageWithTooltip" ErrorText="Required">
                            <RequiredField IsRequired="True" ErrorText="Required" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    State
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtBillingState" runat="server" Width="170px" TabIndex="12">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Country
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <dx:ASPxComboBox ID="cmbBillingCountry" runat="server" ValueType="System.Int32" IncrementalFilteringMode="Contains"
                                    TabIndex="13">
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td height="22" class="info-lbl">
                    Post Code
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtBillingPostCode" runat="server" Width="170px" TabIndex="14">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HiddenField ID="hdnCustomerId" runat="server" Value="0" />
                    <asp:HiddenField ID="hdnFromURL" runat="server" />
                </td>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" id="customer-info-btn-tbl">
                        <tr>
                            <td width="52" align="left">
                                <dx:ASPxButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="vgCustomer"
                                    HorizontalAlign="Center" ImageSpacing="15px" VerticalAlign="Middle" TabIndex="26">
                                    <Image Url="~/Images/Save.png">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                            <td width="52" align="left">
                                <dx:ASPxButton ID="btnClear" runat="server" Text="Clear" HorizontalAlign="Center"
                                    ImageSpacing="15px" VerticalAlign="Middle" UseSubmitBehavior="False" AutoPostBack="false"
                                    OnClick="btnClear_Click" TabIndex="27">
                                    <Image Url="~/Images/Clear.png">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                            <td width="52" align="left">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxPopupControl ID="pcGuestType" runat="server" HeaderText="Guest Type" AllowDragging="True"
            ClientInstanceName="ppcGuestType" Modal="True" PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="WindowCenter" 
            ContentUrl="~/ControlPanel/GuestTypes.aspx" Width="700px" Height="350px">
            <ContentCollection>

            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
