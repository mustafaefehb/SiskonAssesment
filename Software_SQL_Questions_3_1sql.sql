
GO
/****** Object:  UserDefinedFunction [dbo].[GetRoleUsers]    Script Date: 2/22/2023 8:06:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER FUNCTION [dbo].[GetRoleUsers]
(
@RoleID INT
) 
RETURNS @ResultTable TABLE
( 
UserID int, UserName nvarchar(100)
) AS BEGIN

	;WITH ret AS(
        SELECT  UserID,RoleID
        FROM    UserRoleAssignment
        WHERE   RoleId = @RoleID
        UNION ALL
        SELECT  0  UserID, T.RoleID
        FROM    RoleRoleAssignment t INNER JOIN
                ret r ON t.ParentRoleID = r.RoleID
	)

	INSERT INTO @ResultTable
	SELECT 
	U.UserID,
	U.UserName
	FROM
	[User] U
	JOIN ret UR ON UR.UserID = U.UserID  
        
RETURN
END

