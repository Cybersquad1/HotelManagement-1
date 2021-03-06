﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GenMan = HBM.GeneralManagement;
using DevExpress.Web.ASPxGridView;
using System.Data;
using HBM.Common;
using System.Collections;
using DevExpress.Web.ASPxEditors;
using HBM.SessionManager;

namespace HBM.Reservation
{
    public partial class Rooms : System.Web.UI.Page
    {
        DataSet dsData = new DataSet();
        DataSet dsBedTypes = new DataSet();

        GenMan.Room rooms = new GenMan.Room();
        GenMan.BedType bedTypes = new GenMan.BedType();

        protected void Page_Init(object sender, EventArgs e)
        {
            gvRooms.SettingsText.ConfirmDelete = Messages.Delete_Confirm;

            this.LoadRooms();
            this.LoadBedType();


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                gvRooms.DataBind();
            }
            catch (System.Exception)
            {


            }
        }

        protected void LoadRooms()
        {
            try
            {
                rooms.CompanyId = SessionHandler.CurrentCompanyId;
                dsData = rooms.SelectAllDataset();
                gvRooms.DataMember = dsData.Tables[0].TableName;
                gvRooms.DataSource = dsData.Tables[0];

                dsData.Tables[0].PrimaryKey = new DataColumn[] { dsData.Tables[0].Columns["RoomId"] };
                Session[Constants.SESSION_ROOMS] = dsData;
            }
            catch (System.Exception)
            {


            }
        }

        protected void LoadBedType()
        {
            try
            {
                bedTypes.CompanyId = SessionHandler.CurrentCompanyId;
                dsBedTypes = bedTypes.SelectAllDataset();
                dsBedTypes.Tables[0].TableName = "BedType";
                ((GridViewDataComboBoxColumn)gvRooms.Columns["BedTypeId"]).PropertiesComboBox.DataSource = dsBedTypes.Tables[0];

            }
            catch (System.Exception)
            {


            }
        }

        protected void gvRooms_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            dsData = Session[Constants.SESSION_ROOMS] as DataSet;
            ASPxGridView gridView = sender as ASPxGridView;
            DataRow row = dsData.Tables[0].NewRow();
            Random rd = new Random();
            e.NewValues["RoomId"] = rd.Next();
            e.NewValues["StatusId"] = (int)Enums.HBMStatus.Active;
            e.NewValues["CompanyId"] = SessionHandler.CurrentCompanyId;
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

            dsData.Tables[0].Rows.Add(row);

            rooms.RoomCode = e.NewValues["RoomCode"].ToString();

            //if (!rooms.IsDuplicateTypeName())
            //{
                if (rooms.Save(dsData))
                {
                    this.LoadRooms();
                }
            //}
            //else
            //{
                //throw new System.Exception(Messages.Duplicate_record);
            //}

        }

        protected void gvRooms_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            dsData = Session[Constants.SESSION_ROOMS] as DataSet;
            ASPxGridView gridView = sender as ASPxGridView;
            DataTable dataTable = dsData.Tables[0];
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

            rooms.RoomId = Convert.ToInt32(e.Keys["RoomId"].ToString());
            rooms.RoomCode = e.NewValues["RoomCode"].ToString();

            //if (!rooms.IsDuplicateTypeName())
            //{
                if (rooms.Save(dsData))
                {
                    this.LoadRooms();
                }
            //}
            //else
            //{
                throw new System.Exception(Messages.Duplicate_record);
            //}

        }

        protected void gvRooms_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int i = gvRooms.FindVisibleIndexByKeyValue(e.Keys[gvRooms.KeyFieldName]);
            e.Cancel = true;
            dsData = Session[Constants.SESSION_ROOMS] as DataSet;
            //dsData.Tables[0].Rows.Remove(dsData.Tables[0].Rows.Find(e.Keys[gvData.KeyFieldName]));

            dsData.Tables[0].DefaultView.Delete(dsData.Tables[0].Rows.IndexOf(dsData.Tables[0].Rows.Find(e.Keys[gvRooms.KeyFieldName])));


            if (rooms.Save(dsData))
            {
                this.LoadRooms();
            }

        }

        protected void gvRooms_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName != "BedTypeId") return;

            ASPxComboBox combo = e.Editor as ASPxComboBox;
            combo.DataBindItems();
        }

        protected void gvRooms_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;

            switch (e.ButtonType)
            {
                case ColumnCommandButtonType.New:
                    e.Visible = SessionHandler.LoggedUser.IsUserAuthorised(Enums.Rights.GeneralManagement_Rooms_Add);
                    break;
                case ColumnCommandButtonType.Edit:
                    e.Visible = SessionHandler.LoggedUser.IsUserAuthorised(Enums.Rights.GeneralManagement_Rooms_Edit);
                    break;
                case ColumnCommandButtonType.Delete:
                    e.Visible = SessionHandler.LoggedUser.IsUserAuthorised(Enums.Rights.GeneralManagement_Rooms_Delete);
                    break;
            }
        }
    }
}