#Set up SQL Server connection
$MSSQL_Connection = New-Object System.Data.SqlClient.SqlConnection
$MSSQL_Connection.ConnectionString = "Server=172.16.1.110;Database=K1LL3R;User Id=sa;Password=Silverlake@1"
$MSSQL_Connection.Open()

#Prepare data for insertion into IBM temporary table
$MSSQL_SelectStatement = 
    "SELECT TOP 5 
    CPU_SHORT, 
    CLOCK_SPEED, 
    RAM, 
    HDD, 
    SERIAL, 
    PCID, 
    USER_ID, 
    OWNER, 
    PURCHASE_DATE, 
    '3', 
    LOCATION, 
    PROVIDER_ID, 
    ETHERNET, 
    WIFI, 
    USER_NAME, 
    '1.00', 
    TEAM_CODE

    FROM 
    [GSHEET.ASSET_PRIVATE] 
    WHERE 
    BATCH = 'Y' OR BATCH = 'y'"

#, '1', '1', PCID, USER_ID, OWNER, PURCHASE_DATE, '1', '3', '1', LOCATION, PROVIDER_ID, '1', '1', '1', '1', '1', ETHERNET, WIFI, '1', USER_NAME, '1', '1.00', PO_NUMBER, TEAM_CODE 
#PCID, CLOCK_SPEED, RAM, HDD, SERIAL, ETHERNET, WIFI, CPU_SHORT, BRAND, PURCHASE_DATE, PROVIDER_ID, PO_NUMBER, OWNER, USER_NAME, USER_ID, LOCATION, TEAM_CODE 

$MSSQL_DBCommand = New-Object System.Data.SQLClient.SQLCommand
$MSSQL_DBCommand.Connection = $MSSQL_Connection
$MSSQL_DBCommand.CommandText = $MSSQL_SelectStatement
$MSSQL_DBResult = $MSSQL_DBCommand.ExecuteReader()
$MSSQL_DataTable = New-Object System.Data.DataTable
$MSSQL_DataTable.Load($MSSQL_DBResult)

#Debug output
Write-Output $MSSQL_DataTable

#Write to IBM temporary table
$IBM_DBString = 'DSN=KULAS1;Uid=EDMUND;Pwd=ecpn$735472752'
$IBM_DBConnection = New-Object System.Data.Odbc.OdbcConnection
$IBM_DBConnection.ConnectionString = $IBM_DBString
$IBM_DBConnection.Open()
$IBM_DBCommand = New-Object System.Data.Odbc.OdbcCommand
$IBM_DBCommand.Connection = $IBM_DBConnection
foreach ($R in $MSSQL_DataTable.Rows)
{ 
    $IBM_InsertStatement = "INSERT INTO EDMUND.ADDPCHDW (
        PCCPUT, PCCPUS, PCREMS, PCDSKS, PCCPSR, PCPCID, PCUSER, PCOWNR, PCPCHD, PCWPRD, PCLOCT, PCPVID, PCNICA, PCNIC2, PCDESC, PCPRIC, PCTEAM)
        VALUES ('$($R[0])', '$($R[1])', '$($R[2])', '$($R[3])', '$($R[4])', '$($R[5])', '$($R[6])', '$($R[7])', '$($R[8])', '$($R[9])', '$($R[10])', '$($R[11])', '$($R[12])', '$($R[13])', '$($R[14])', '$($R[15])', '$($R[16])')"
        

        #, PCMNSR, PCMONT, PCPCID, PCUSER, PCOWNR, PCPCHD, PCLUPD, PCWPRD, PCPRTR, PCLOCT, PCPVID, PCSOCD, PCCDRM, PCPRDN, PCNWIC, PCIPAD, PCNICA, PCNIC2, PCCONN, PCDESC, PCPURP, PCPRIC, PCQNBR, PCTEAM)            
        #, '$($R[5])', '$($R[6])', '$($R[7])', '$($R[8])', '$($R[9])', '$($R[10])', '$($R[11])', '$($R[12])', '$($R[13])', '$($R[14])', '$($R[16])', '$($R[17])' , '$($R[18])', '$($R[19])' , '$($R[20])', '$($R[21])', '$($R[22])', '$($R[23])', '$($R[24])', '$($R[25])', '$($R[26])', '$($R[27])', '$($R[28])')"

    Write-Output $IBM_InsertStatement
    $IBM_DBCommand.CommandText = $IBM_InsertStatement
    $IBM_DBCommand.ExecuteNonQuery()
}

#Close the connection(s)
$MSSQL_Connection.Close()
$IBM_DBConnection.Close()