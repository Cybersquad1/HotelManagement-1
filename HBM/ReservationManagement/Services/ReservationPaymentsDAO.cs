﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using HBM.Common;

namespace HBM.ReservationManagement
{
    public class ReservationPaymentsDAO
    {
        public bool InsertUpdateDelete(DataSet ds)
        {

            Database db = DatabaseFactory.CreateDatabase(Constants.HBMCONNECTIONSTRING);
            DbCommand commandInsert = db.GetStoredProcCommand("usp_ReservationPaymentInsert");

            db.AddInParameter(commandInsert, "@ReservationId", DbType.Int32, "ReservationId", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@PaymentAmount", DbType.Decimal, "PaymentAmount", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@PaymentDate", DbType.DateTime, "PaymentDate", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@ReferenceNumber", DbType.String, "ReferenceNumber", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@Notes", DbType.String, "Notes", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@PaymentTypeId", DbType.Int32, "PaymentTypeId", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@CurrencyId", DbType.Int32, "CurrencyId", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@Notes", DbType.String, "Notes", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@CreditCardTypeId", DbType.Int32, "CreditCardTypeId", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@CCNo", DbType.String, "CCNo", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@CCExpirationDate", DbType.DateTime, "CCExpirationDate", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@CCNameOnCard", DbType.String, "CCNameOnCard", DataRowVersion.Current);            
            db.AddInParameter(commandInsert, "@CreatedUser", DbType.Int32, "CreatedUser", DataRowVersion.Current);
            db.AddInParameter(commandInsert, "@StatusId", DbType.Int32, "StatusId", DataRowVersion.Current);

            DbCommand commandUpdate = db.GetStoredProcCommand("usp_ReservationPaymentUpdate");

            db.AddInParameter(commandUpdate, "@ReservationPaymentId", DbType.Decimal, "ReservationPaymentId", DataRowVersion.Current);           
            db.AddInParameter(commandUpdate, "@PaymentAmount", DbType.Decimal, "PaymentAmount", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@PaymentDate", DbType.DateTime, "PaymentDate", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@ReferenceNumber", DbType.String, "ReferenceNumber", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@Notes", DbType.String, "Notes", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@PaymentTypeId", DbType.Int32, "PaymentTypeId", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@CurrencyId", DbType.Int32, "CurrencyId", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@Notes", DbType.String, "Notes", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@CreditCardTypeId", DbType.Int32, "CreditCardTypeId", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@CCNo", DbType.String, "CCNo", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@CCExpirationDate", DbType.DateTime, "CCExpirationDate", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@CCNameOnCard", DbType.String, "CCNameOnCard", DataRowVersion.Current);  
            db.AddInParameter(commandUpdate, "@UpdatedUser", DbType.Int32, "UpdatedUser", DataRowVersion.Current);
            db.AddInParameter(commandUpdate, "@StatusId", DbType.Int32, "StatusId", DataRowVersion.Current);

            DbCommand commandDelete = db.GetStoredProcCommand("usp_ReservationPaymentDelete");
            db.AddInParameter(commandDelete, "@ReservationPaymentId", DbType.Int64, "ReservationPaymentId", DataRowVersion.Current);

            db.UpdateDataSet(ds, ds.Tables[0].TableName, commandInsert, commandUpdate, commandDelete, UpdateBehavior.Transactional);

            return true;
        }

        public DataSet SelectByReservationID(ReservationPayments reservationPayments)
        {

            Database db = DatabaseFactory.CreateDatabase(Constants.HBMCONNECTIONSTRING);
            DbCommand dbCommand = db.GetStoredProcCommand("usp_ReservationPaymentSelectByReservationID");
            db.AddInParameter(dbCommand, "@ReservationId", DbType.Int32, reservationPayments.ReservationId);

            return db.ExecuteDataSet(dbCommand);


        }
    }
}