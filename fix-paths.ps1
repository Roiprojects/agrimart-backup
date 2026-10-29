$srcPath = "c:\Users\HP\Desktop\Agrimart-backup\Agrimart-backup-index.html"
$dstPath = "c:\Users\HP\Desktop\Agrimart-backup\index.html"

$text = [System.IO.File]::ReadAllText($srcPath, [System.Text.Encoding]::UTF8)

# Replace leading slash with relative path
$text = $text.Replace('"/assests/', '"assests/')
$text = $text.Replace("'/assests/", "'assests/")
$text = $text.Replace('"/uploads/', '"uploads/')
$text = $text.Replace("'/uploads/", "'uploads/")
$text = $text.Replace('url(&quot;/assests/', 'url(&quot;assests/')
$text = $text.Replace('url("/assests/', 'url("assests/')
$text = $text.Replace("url('/assests/", "url('assests/")
$text = $text.Replace('url(/assests/', 'url(assests/')

# Also handle https://agrimart.in//assests/
$text = $text.Replace('https://agrimart.in//assests/', 'assests/')
$text = $text.Replace('https://agrimart.in/assests/', 'assests/')

[System.IO.File]::WriteAllText($dstPath, $text, [System.Text.Encoding]::UTF8)
Write-Host "Updated index.html with relative paths."
