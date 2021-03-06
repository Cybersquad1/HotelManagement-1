﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HBM.Common
{
    public static class Messages
    {
        public static readonly string Save_Success = "Successfully Saved";
        public static readonly string Update_Success = "Successfully Updated";        
        public static readonly string Delete_Success = "Successfully Deleted";

        public static readonly string Save_Unsuccess = "Cannot Save";
        public static readonly string Update_Unsuccess = "Cannot Update";
        public static readonly string Delete_Unsuccess = "Cannot Delete";

        public static readonly string Delete_Confirm = "Are you sure you want to delete this record?";

        public static readonly string Invalid_Credentials = "Invalid Credentials";
        
        public static readonly string Duplicate_Username= "Username already exists";
        public static readonly string Duplicate_Email= "Email already exists";
        public static readonly string Duplicate_Rolename= "Role name already exists";

        public static readonly string Select_Role = "Please select a role";
        public static readonly string Reservation_RoomInfoEmpty = "Can not Save, Room information is empty";
        public static readonly string Reservation_RoomRateisEmpty= "Room rate is empty";
        public static readonly string Reservation_NoAvailableRooms= "No room is available";
        public static readonly string Reservation_RoomIsAlreadAdded= "Room is already added";


        public static readonly string Save_Unsuccess_BillingAddress_Notprovided = Save_Unsuccess + " Billing Address details are not properly provided";

        public static readonly string Duplicate_record = "Can not continue. Record is already exists!";

        public static readonly string UnauthorisedExceptionMessage = "You are not authorised to do this task";


    }
}
