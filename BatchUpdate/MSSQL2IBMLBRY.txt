#Set up SQL Server connection
$MSSQL_Connection = New-Object System.Data.SqlClient.SqlConnection
$MSSQL_Connection.ConnectionString = "Server=172.16.1.110;Database=K1LL3R;User Id=sa;Password=Silverlake@1"
$MSSQL_Connection.Open()

#Prepare data for insertion into IBM temporary table
$MSSQL_SelectStatement = 
    "SELECT TOP 100 
    CPU_SHORT, 
    CLOCK_SPEED, 
    RAM, 
    HDD, 
    SERIAL, 
    '0',
    '0',
    PCID, 
    USER_ID, 
    OWNER, 
    PURCHASE_DATE,
    '0',
    '3',
    '0',
    LOCATION, 
    PROVIDER_ID, 
    '0',
    '0',
    '0',
    '0',
    '0' ,
    ETHERNET, 
    WIFI, 
    '0',
    USER_NAME, 
    '0',
    '1.00', 
    PO_NUMBER,
    TEAM_CODE
    
    FROM 
    [GSHEET.ASSET_PRIVATE] 
    WHERE 
    BATCH = 'Y' OR BATCH = 'y'"

$MSSQL_DBCommand = New-Object System.Data.SQLClient.SQLCommand
$MSSQL_DBCommand.Connection = $MSSQL_Connection
$MSSQL_DBCommand.CommandText = $MSSQL_SelectStatement
$MSSQL_DBResult = $MSSQL_DBCommand.ExecuteReader()
$MSSQL_DataTable = New-Object System.Data.DataTable
$MSSQL_DataTable.Load($MSSQL_DBResult)

#Debug output
Write-Output $MSSQL_DataTable

#Write to IBM temporary table
$IBM_DBString = 'DSN=KULAS1;Uid=EDMUND;Pwd='
$IBM_DBConnection = New-Object System.Data.Odbc.OdbcConnection
$IBM_DBConnection.ConnectionString = $IBM_DBString
$IBM_DBConnection.Open()
$IBM_DBCommand = New-Object System.Data.Odbc.OdbcCommand
$IBM_DBCommand.Connection = $IBM_DBConnection
foreach ($R in $MSSQL_DataTable.Rows)
{ 
    $IBM_InsertStatement = "INSERT INTO EDMUND.ADDPCHDW (
        PCCPUT, PCCPUS, PCREMS, PCDSKS , PCCPSR, PCMNSR, PCMONT, 
        PCPCID, PCUSER, PCOWNR, PCPCHD, PCLUPD, PCWPRD, PCPRTR, 
        PCLOCT, PCPVID, PCSOCD, PCCDRM, PCPRDN, PCNWIC, PCIPAD, 
        PCNICA, PCNIC2, PCCONN, PCDESC, PCPURP, PCPRIC, PCQNBR, PCTEAM)
        VALUES (
            '$($R[0])', '$($R[1])', '$($R[2])', '$($R[3])', 
            '$($R[4])', '$($R[5])', '$($R[6])', '$($R[7])', 
            '$($R[8])', '$($R[9])', '$($R[10])', '$($R[11])', 
            '$($R[12])', '$($R[13])', '$($R[14])', '$($R[15])', 
            '$($R[16])', '$($R[17])', '$($R[18])',  '$($R[19])' , 
            '$($R[20])', '$($R[21])', '$($R[22])',  '$($R[23])', 
            '$($R[24])', '$($R[25])', '$($R[26])', '$($R[27])', '$($R[28])')"
        

    Write-Output $IBM_InsertStatement
    $IBM_DBCommand.CommandText = $IBM_InsertStatement
    $IBM_DBCommand.ExecuteNonQuery()
}

#Close the connection(s)
$MSSQL_Connection.Close()
$IBM_DBConnection.Close()