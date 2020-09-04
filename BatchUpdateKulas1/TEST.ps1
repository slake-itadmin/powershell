#Set up ODBC connection
$IBM_DBString = 'DSN=KULAS1;Uid=EDMUND;Pwd=ecpn$735472752'
$IBM_DBConnection = New-Object System.Data.Odbc.OdbcConnection
$IBM_DBConnection.ConnectionString = $IBM_DBString
$IBM_DBConnection.Open()
$IBM_DBCommand = New-Object System.Data.Odbc.OdbcCommand
$IBM_DBCommand.Connection = $IBM_DBConnection

#Check Edmund's temporary table
$IBM_SelectStatement = "SELECT * FROM EDMUND.ADDPCHDW"
$IBM_DBCommand.CommandText = $IBM_SelectStatement
$IBM_DBResult = $IBM_DBCommand.ExecuteReader()
$IBM_UserTable = New-Object System.Data.Datatable
$IBM_UserTable.Load($IBM_DBResult)
$DataTableEdmundPCHDW = $IBM_UserTable

#Write-Output $DataTableEdmundPCHDW

#Close connection and write to file(s)
$IBM_DBConnection.Close()
$DataTableEdmundPCHDW     | ConvertTo-Csv -NoTypeInformation > EDMUND.ADDPCHDW.csv