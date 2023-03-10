
GO
/****** Object:  UserDefinedFunction [dbo].[GetUserRoles]    Script Date: 2/22/2023 8:07:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[GetUserRoles]
(
@UserId INT
) 
RETURNS @ResultTable TABLE
( 
RoleID int, RoleName nvarchar(100)
) AS BEGIN

	;WITH ret AS(
			SELECT  *
			FROM    UserRoleAssignment
			WHERE   UserID = @UserId
			UNION ALL
			SELECT  t.*
			FROM    RoleRoleAssignment t INNER JOIN
					ret r ON t.ParentRoleID = r.RoleID
	)

	INSERT INTO @ResultTable
	SELECT 
	R.RoleID,
	R.RoleName
	FROM
	Role R
	JOIN ret UR ON UR.RoleID = R.RoleID       
        
RETURN
END