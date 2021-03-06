/****** Object:  StoredProcedure [dbo].[usp_CustomerSelectAll]    Script Date: 10/21/2013 07:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[usp_CustomerSelectAll] 
    
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [CustomerId], [CompanyId], [CustomerName], [MemberCode], [Gender], [GuestTypeId], [Phone], [Fax], [Mobile], [Email], [CompanyName], [CompanyAddress], [CompanyNotes], [BillingAddress], [BillingCity], [BillingState], [BillingCountryId], [BillingPostCode], [PassportNumber], [PassportCountryOfIssue], [PassportExpirationDate], [CCType], [CCNo], [CCExpirationDate], [CCNameOnCard], [Car], [CarLicensePlate], [DriverLicense], [StatusId], [CreatedUser], [CreatedDate], [UpdatedUser], [UpdatedDate], [IsDeleted] 
	FROM   [dbo].[Customer] 
	

	COMMIT
