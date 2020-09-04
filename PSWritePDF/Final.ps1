# Convert PDF to txt
Convert-PDFToText -FilePath "E:\OneDrive\PowerShell\PSWritePDF\Example06.pdf" -Page 2 | Out-File -FilePath "E:\OneDrive\PowerShell\PSWritePDF\E06.txt"

# Import txt file 
$FileList = Get-ChildItem -LiteralPath E:\OneDrive\PowerShell\PSWritePDF\E06.txt

# Extract email to csv
$Results = foreach ($FL_Item in $FileList)
    {
    $FLI_Content = Get-Content -LiteralPath $FL_Item.FullName -Raw
    $Email = (($FLI_Content -split 'Email:')[-1] -split 'Community:')[0].Trim()
        # this gets rid of blank items
        Where({$_})

    [PSCustomObject]@{
        Email = $Email
        }
    }

$Results

$Results |
    Export-Csv -LiteralPath "E:\OneDrive\PowerShell\PSWritePDF\R06.csv" -NoTypeInformation


--------------------------------------------------------------------- Exmaple 6--------------------------------------------------------------------------------

#PDF to PNG
magick convert -density 100 -quality 100 E:\OneDrive\PowerShell\PSWritePDF\Example06.pdf E:\OneDrive\PowerShell\PSWritePDF\Example06.png

#PNG to TXT
tesseract.exe "E:\OneDrive\PowerShell\PSWritePDF\Example06.png" "E:\OneDrive\PowerShell\PSWritePDF\Example06"

#TXT to Result
$FileList = Get-ChildItem -LiteralPath "E:\OneDrive\PowerShell\PSWritePDF\Example06.txt"

# Extract email to csv
$Results = foreach ($FL_Item in $FileList)
    {
    $FLI_Content = Get-Content -LiteralPath $FL_Item.FullName -Raw
    $Email = (($FLI_Content -split 'Email:')[-1] -split 'Community:')[0].Trim()
        # this gets rid of blank items
        Where({$_})

    [PSCustomObject]@{
        Email = $Email
        }
    }

$Results

$Results |
    Export-Csv -LiteralPath "E:\OneDrive\PowerShell\PSWritePDF\Result06.csv" -NoTypeInformation

--------------------------------------------------------------------- Exmaple 7--------------------------------------------------------------------------------

#PDF to PNG
magick convert -density 100 -quality 100 E:\OneDrive\PowerShell\PSWritePDF\Example07.pdf E:\OneDrive\PowerShell\PSWritePDF\Example07.png

#PNG to TXT
tesseract.exe "E:\OneDrive\PowerShell\PSWritePDF\Example07.png" "E:\OneDrive\PowerShell\PSWritePDF\Example07"

#TXT to Result
$FileList = Get-ChildItem -LiteralPath "E:\OneDrive\PowerShell\PSWritePDF\Example07.txt"

# Extract email to csv
$Results = foreach ($FL_Item in $FileList)
    {
    $FLI_Content = Get-Content -LiteralPath $FL_Item.FullName -Raw
    $Soldto = (($FLI_Content -split 'SOLD TO:')[-1] -split 'ATTENTION:')[0].Trim()
    $Deliveryto = @(((($FLI_Content -split 'DELIVERY TO:')[-1] -split 'ATTENTION:')[0] -split
        [environment]::NewLine).Trim()).
        # this gets rid of blank items
        Where({$_})

    [PSCustomObject]@{
        Sold to = $Soldto
        Delivery to = $Deliveryto -join '; '
        }
    }

$Results

$Results |
    Export-Csv -LiteralPath "E:\OneDrive\PowerShell\PSWritePDF\Result07.csv" -NoTypeInformation














