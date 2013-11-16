﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Res = HBM.ReservationManagement;
using GenMan = HBM.GeneralManagement;
using HBM.CustomerManagement;
using System.Data;
using DevExpress.Web.ASPxGridView;
using HBM.Common;
using HBM.SessionManager;
using System.Collections;
using DevExpress.Web.ASPxEditors;
using HBM.GeneralManagement;
using GenRes = HBM.ReservationManagement;

namespace HBM.Reservation
{
    public partial class Booking : System.Web.UI.Page
    {
        DataSet dsAdditionalService = new DataSet();
        DataSet dsPaymentInformation = new DataSet();
        GenMan.AdditionalService additionalService = new GenMan.AdditionalService();
        GenRes.ReservationAdditionalService reservationAdditionalService = new GenRes.ReservationAdditionalService();
        GenRes.ReservationPayments reservationPayments = new GenRes.ReservationPayments();


        protected void Page_Init(object sender, EventArgs e)
        {
            gvServiceInformation.SettingsText.ConfirmDelete = Messages.Delete_Confirm;
            gvPaymentInformation.SettingsText.ConfirmDelete = Messages.Delete_Confirm;

            gvPaymentInformation.SettingsPager.PageSize = Constants.GRID_PAGESIZE;
            gvServiceInformation.SettingsPager.PageSize = Constants.GRID_PAGESIZE;

            ((GridViewDataComboBoxColumn)gvServiceInformation.Columns["AdditionalServiceId"]).PropertiesComboBox.DataSource = new GenMan.AdditionalService() { CompanyId = Master.CurrentCompany.CompanyId }.SelectAllDataset().Tables[0];
            ((GridViewDataComboBoxColumn)gvPaymentInformation.Columns["CurrencyId"]).PropertiesComboBox.DataSource = new GenMan.CurrencyTypes().SelectAllDataset().Tables[0];
            ((GridViewDataComboBoxColumn)gvPaymentInformation.Columns["PaymentTypeId"]).PropertiesComboBox.DataSource = (new GenMan.PaymentType() { CompanyId = Master.CurrentCompany.CompanyId }).SelectAllDataset().Tables[0];
            ((GridViewDataComboBoxColumn)gvPaymentInformation.Columns["CreditCardTypeId"]).PropertiesComboBox.DataSource = (new GenMan.CreditCardType() { CompanyId = Master.CurrentCompany.CompanyId }).SelectAllDataset().Tables[0];
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.LoadInitialData();
                this.LoadAddiotnalService();
                this.LoadPaymentInformation();
            }
        }

        private void LoadInitialData()
        {
            //cmbResStatus.DataSource = new GenMan.Status().SelectAllList();
            //cmbResStatus.TextField = "StatusName";
            //cmbResStatus.ValueField = "StatusId";
            //cmbResStatus.DataBind();

            //cmbGuarantee.DataSource = new GenMan.Gaurantee() { CompanyId = Master.CurrentCompany.CompanyId }.SelectAllDataset();
            //cmbGuarantee.TextField = "GuaranteeName";
            //cmbGuarantee.ValueField = "GuaranteeId";
            //cmbGuarantee.DataBind();

            cmbCustomer.DataSource = new Customer() { CompanyId = Master.CurrentCompany.CompanyId }.SelectAllDataset().Tables[0];
            cmbCustomer.TextField = "CustomerName";
            cmbCustomer.ValueField = "CustomerId";
            cmbCustomer.DataBind();

            //cmbCustomerAdd.DataSource = new Customer() { CompanyId = Master.CurrentCompany.CompanyId }.SelectAllDataset().Tables[0];
            //cmbCustomerAdd.TextField = "CustomerName";
            //cmbCustomerAdd.ValueField = "CustomerId";
            //cmbCustomerAdd.DataBind();


            cmbTax.DataSource = new GenMan.TaxType() { CompanyId = Master.CurrentCompany.CompanyId }.SelectAllDataset().Tables[0];
            cmbTax.TextField = "TaxTypeName";
            cmbTax.ValueField = "TaxTypeId";
            cmbTax.DataBind();

            cmbSource.DataSource = new GenMan.Source() { CompanyId = Master.CurrentCompany.CompanyId }.SelectAllDataset().Tables[0];
            cmbSource.TextField = "SourceName";
            cmbSource.ValueField = "SourceId";
            cmbSource.DataBind();


            cmbRoom.DataSource = new GenMan.Room() { CompanyId = Master.CurrentCompany.CompanyId }.SelectAllDataset().Tables[0];
            cmbRoom.TextField = "RoomName";
            cmbRoom.ValueField = "RoomId";
            cmbRoom.DataBind();

            cmbRatePlan.DataSource = new GenMan.RatePlans() { CompanyId = Master.CurrentCompany.CompanyId }.SelectAllDataset().Tables[0];
            cmbRatePlan.TextField = "RatePlanName";
            cmbRatePlan.ValueField = "RatePlansId";
            cmbRatePlan.DataBind();

        }

        #region Addtional Service

        private void LoadAddiotnalService()
        {
            reservationAdditionalService.ReservationId = 0;
            dsAdditionalService = reservationAdditionalService.SelectAllDataSetByReservationID();
            gvServiceInformation.DataSource = dsAdditionalService.Tables[0];
            gvServiceInformation.DataBind();

            dsAdditionalService.Tables[0].PrimaryKey = new DataColumn[] { dsAdditionalService.Tables[0].Columns["ReservationAdditionalServiceId"] };
            Session[Constants.SESSION_RESERVATION_ADDTIONALSERVICE] = dsAdditionalService;

        }

        protected void gvServiceInformation_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int i = gvServiceInformation.FindVisibleIndexByKeyValue(e.Keys[gvServiceInformation.KeyFieldName]);
            e.Cancel = true;
            dsAdditionalService = Session[Constants.SESSION_RESERVATION_ADDTIONALSERVICE] as DataSet;

            dsAdditionalService.Tables[0].DefaultView.Delete(dsAdditionalService.Tables[0].Rows.IndexOf(dsAdditionalService.Tables[0].Rows.Find(e.Keys[gvServiceInformation.KeyFieldName])));

            gvServiceInformation.DataSource = dsAdditionalService.Tables[0];
            gvServiceInformation.DataBind();

        }

        protected void gvServiceInformation_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            dsAdditionalService = Session[Constants.SESSION_RESERVATION_ADDTIONALSERVICE] as DataSet;
            ASPxGridView gridView = sender as ASPxGridView;
            DataRow row = dsAdditionalService.Tables[0].NewRow();

            Random rd = new Random();
            e.NewValues["ReservationAdditionalServiceId"] = rd.Next();

            Random rd1 = new Random();
            e.NewValues["ReservationId"] = rd1.Next();


            e.NewValues["StatusId"] = (int)Enums.HBMStatus.Active;
            e.NewValues["CreatedUser"] = SessionHandler.LoggedUser.UsersId;

            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            while (enumerator.MoveNext())
            {
                if (enumerator.Key.ToString() != "Count")
                {
                    row[enumerator.Key.ToString()] = enumerator.Value == null ? DBNull.Value : enumerator.Value;
                }
            }
            gridView.CancelEdit();
            e.Cancel = true;

            dsAdditionalService.Tables[0].Rows.Add(row);

            gvServiceInformation.DataSource = dsAdditionalService.Tables[0];
            gvServiceInformation.DataBind();

        }

        protected void gvServiceInformation_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            dsAdditionalService = Session[Constants.SESSION_RESERVATION_ADDTIONALSERVICE] as DataSet;
            ASPxGridView gridView = sender as ASPxGridView;
            DataTable dataTable = dsAdditionalService.Tables[0];
            DataRow row = dataTable.Rows.Find(e.Keys[0]);
            e.NewValues["StatusId"] = (int)Enums.HBMStatus.Modify;
            e.NewValues["UpdatedUser"] = SessionHandler.LoggedUser.UsersId;
            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            while (enumerator.MoveNext())
            {
                row[enumerator.Key.ToString()] = enumerator.Value == null ? DBNull.Value : enumerator.Value;
            }

            gridView.CancelEdit();
            e.Cancel = true;

            gvServiceInformation.DataSource = dsAdditionalService.Tables[0];
            gvServiceInformation.DataBind();

        }

        protected void gvServiceInformation_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName != "AdditionalServiceId") return;

            ASPxComboBox combo = e.Editor as ASPxComboBox;
            combo.DataBindItems();
        }

        #endregion

        #region Payment Information

        private void LoadPaymentInformation()
        {
            reservationPayments.ReservationId = 0;
            dsPaymentInformation = reservationPayments.SelectAllDataSetByReservationID();
            gvPaymentInformation.DataSource = dsPaymentInformation.Tables[0];
            gvPaymentInformation.DataBind();

            dsPaymentInformation.Tables[0].PrimaryKey = new DataColumn[] { dsPaymentInformation.Tables[0].Columns["ReservationPaymentId"] };
            Session[Constants.SESSION_RESERVATION_PAYMENTINFORMATION] = dsPaymentInformation;

        }

        protected void gvPaymentInformation_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            int i = gvPaymentInformation.FindVisibleIndexByKeyValue(e.Keys[gvPaymentInformation.KeyFieldName]);
            e.Cancel = true;
            dsPaymentInformation = Session[Constants.SESSION_RESERVATION_PAYMENTINFORMATION] as DataSet;
            //dsData.Tables[0].Rows.Remove(dsData.Tables[0].Rows.Find(e.Keys[gvData.KeyFieldName]));

            dsPaymentInformation.Tables[0].DefaultView.Delete(dsPaymentInformation.Tables[0].Rows.IndexOf(dsPaymentInformation.Tables[0].Rows.Find(e.Keys[gvPaymentInformation.KeyFieldName])));

            gvPaymentInformation.DataSource = dsPaymentInformation.Tables[0];
            gvPaymentInformation.DataBind();

        }

        protected void gvPaymentInformation_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            dsPaymentInformation = Session[Constants.SESSION_RESERVATION_PAYMENTINFORMATION] as DataSet;
            ASPxGridView gridView = sender as ASPxGridView;
            DataRow row = dsPaymentInformation.Tables[0].NewRow();
            Random rd = new Random();
            e.NewValues["ReservationPaymentId"] = rd.Next();

            Random rd1 = new Random();
            e.NewValues["ReservationId"] = rd.Next();
            e.NewValues["StatusId"] = (int)Enums.HBMStatus.Active;
            //e.NewValues["CompanyId"] = SessionHandler.CurrentCompanyId; ;
            e.NewValues["CreatedUser"] = SessionHandler.LoggedUser.UsersId;

            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            while (enumerator.MoveNext())
            {
                if (enumerator.Key.ToString() != "Count")
                {
                    row[enumerator.Key.ToString()] = enumerator.Value == null ? DBNull.Value : enumerator.Value;
                }
            }
            gridView.CancelEdit();
            e.Cancel = true;

            dsPaymentInformation.Tables[0].Rows.Add(row);

            gvPaymentInformation.DataSource = dsPaymentInformation.Tables[0];
            gvPaymentInformation.DataBind();

        }

        protected void gvPaymentInformation_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            dsPaymentInformation = Session[Constants.SESSION_RESERVATION_PAYMENTINFORMATION] as DataSet;
            ASPxGridView gridView = sender as ASPxGridView;
            DataTable dataTable = dsPaymentInformation.Tables[0];
            DataRow row = dataTable.Rows.Find(e.Keys[0]);
            e.NewValues["StatusId"] = (int)Enums.HBMStatus.Modify;
            e.NewValues["UpdatedUser"] = SessionHandler.LoggedUser.UsersId;
            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
            while (enumerator.MoveNext())
            {
                row[enumerator.Key.ToString()] = enumerator.Value == null ? DBNull.Value : enumerator.Value;
            }

            gridView.CancelEdit();
            e.Cancel = true;

            gvPaymentInformation.DataSource = dsPaymentInformation.Tables[0];
            gvPaymentInformation.DataBind();
        }

        protected void gvPaymentInformation_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName != "PaymentTypeId" && e.Column.FieldName != "CreditCardTypeId" && e.Column.FieldName != "CurrencyId") return;
            ASPxComboBox combo = e.Editor as ASPxComboBox;
            combo.DataBindItems();
        }

        #endregion
             
      
    }
}