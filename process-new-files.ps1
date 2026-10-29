$workspace = "c:\Users\HP\Desktop\Agrimart-backup"

# 1. Remove duplicate " (1).html" files if the main file exists
$dupFiles = Get-ChildItem -Path $workspace -Filter "* (1).html"
$removedCount = 0
foreach ($dup in $dupFiles) {
    $mainName = $dup.Name.Replace(" (1).html", ".html")
    $mainPath = Join-Path $workspace $mainName
    if (Test-Path $mainPath) {
        Remove-Item $dup.FullName -Force
        $removedCount++
    }
}
Write-Host "Removed $removedCount duplicate (1) files."

# 2. Fix relative paths in all HTML files
$htmlFiles = Get-ChildItem -Path $workspace -Filter "*.html"
$processedCount = 0

foreach ($h in $htmlFiles) {
    $text = [System.IO.File]::ReadAllText($h.FullName, [System.Text.Encoding]::UTF8)
    $modified = $false

    if ($text.Contains('"/assests/')) { $text = $text.Replace('"/assests/', '"assests/'); $modified = $true }
    if ($text.Contains("'/assests/")) { $text = $text.Replace("'/assests/", "'assests/"); $modified = $true }
    if ($text.Contains('"/uploads/')) { $text = $text.Replace('"/uploads/', '"uploads/'); $modified = $true }
    if ($text.Contains("'/uploads/")) { $text = $text.Replace("'/uploads/", "'uploads/"); $modified = $true }
    if ($text.Contains('url(&quot;/assests/')) { $text = $text.Replace('url(&quot;/assests/', 'url(&quot;assests/'); $modified = $true }
    if ($text.Contains('url("/assests/')) { $text = $text.Replace('url("/assests/', 'url("assests/'); $modified = $true }
    if ($text.Contains("url('/assests/")) { $text = $text.Replace("url('/assests/", "url('assests/"); $modified = $true }
    if ($text.Contains('url(/assests/')) { $text = $text.Replace('url(/assests/', 'url(assests/'); $modified = $true }
    if ($text.Contains('https://agrimart.in//assests/')) { $text = $text.Replace('https://agrimart.in//assests/', 'assests/'); $modified = $true }
    if ($text.Contains('https://agrimart.in/assests/')) { $text = $text.Replace('https://agrimart.in/assests/', 'assests/'); $modified = $true }

    if ($modified) {
        [System.IO.File]::WriteAllText($h.FullName, $text, [System.Text.Encoding]::UTF8)
        $processedCount++
    }
}

Write-Host "Processed and updated paths in $processedCount HTML files."
Write-Host "Total valid HTML files now: $($htmlFiles.Count - $removedCount)"
