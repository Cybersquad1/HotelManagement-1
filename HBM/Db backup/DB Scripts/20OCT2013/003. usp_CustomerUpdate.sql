/****** Object:  StoredProcedure [dbo].[usp_CustomerUpdate]    Script Date: 10/21/2013 07:10:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[usp_CustomerUpdate] 
    @CustomerId int,
    @CompanyId int,
    @CustomerName nvarchar(100),
    @MemberCode nvarchar(50),
    @Gender varchar(10),
    @GuestTypeId int,
    @Phone nvarchar(25),
    @Fax nvarchar(25),
    @Mobile nvarchar(25),
    @Email nvarchar(50),
    @CompanyName nvarchar(100),
    @CompanyAddress nvarchar(150),
    @CompanyNotes nvarchar(MAX),
    @BillingAddress nvarchar(MAX),
    @BillingCity nvarchar(50),
    @BillingState nvarchar(50),
    @BillingCountryId int,
    @BillingPostCode nvarchar(50),
    @PassportNumber nvarchar(50),
    @PassportCountryOfIssue int,
    @PassportExpirationDate datetime,
    @CCType int,
    @CCNo int,
    @CCExpirationDate datetime,
    @CCNameOnCard nvarchar(100),
    @Car nvarchar(50),
    @CarLicensePlate nvarchar(50),
    @DriverLicense nvarchar(50),
    @StatusId int,    
    @UpdatedUser int,
    @UpdatedDate datetime,
    @IsDeleted bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Customer]
	SET    [CompanyId] = @CompanyId, [CustomerName] = @CustomerName, [MemberCode] = @MemberCode, [Gender] = @Gender, [GuestTypeId] = @GuestTypeId, [Phone] = @Phone, [Fax] = @Fax, [Mobile] = @Mobile, [Email] = @Email, [CompanyName] = @CompanyName, [CompanyAddress] = @CompanyAddress, [CompanyNotes] = @CompanyNotes, [BillingAddress] = @BillingAddress, [BillingCity] = @BillingCity, [BillingState] = @BillingState, [BillingCountryId] = @BillingCountryId, [BillingPostCode] = @BillingPostCode, [PassportNumber] = @PassportNumber, [PassportCountryOfIssue] = @PassportCountryOfIssue, [PassportExpirationDate] = @PassportExpirationDate, [CCType] = @CCType, [CCNo] = @CCNo, [CCExpirationDate] = @CCExpirationDate, [CCNameOnCard] = @CCNameOnCard, [Car] = @Car, [CarLicensePlate] = @CarLicensePlate, [DriverLicense] = @DriverLicense, [StatusId] = @StatusId, [UpdatedUser] = @UpdatedUser, [UpdatedDate] = @UpdatedDate, [IsDeleted] = @IsDeleted
	WHERE  [CustomerId] = @CustomerId
	


	COMMIT
