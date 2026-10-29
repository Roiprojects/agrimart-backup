$workspace = "c:\Users\HP\Desktop\Agrimart-backup"

# 1. Build product map
$productFiles = Get-ChildItem -Path $workspace -Filter "AM-product-*.html"
$prodMap = @{}

foreach ($f in $productFiles) {
    if ($f.Name -match '^AM-product-\d+-(.+)\.html$') {
        $key = $matches[1]
        $prodMap[$key] = $f.Name
    }
}
Write-Host "Indexed $($prodMap.Count) product files."

# 2. Process all HTML files
$htmlFiles = Get-ChildItem -Path $workspace -Filter "*.html" | Where-Object { $_.Name -notmatch '^Agrimart-backup-' }
$modifiedCount = 0

$prodRegex = [regex]'https://agrimart\.in/index\.php/home/prduct_details/([^"/]+)/([^"/]+)'
$listPageRegex = [regex]'https://agrimart\.in/index\.php/home/list_products/(\d+)'

foreach ($h in $htmlFiles) {
    $text = [System.IO.File]::ReadAllText($h.FullName, [System.Text.Encoding]::UTF8)
    $orig = $text

    # Remap product detail URLs
    $text = $prodRegex.Replace($text, {
        param($m)
        $p1 = $m.Groups[1].Value.Replace('=', '')
        $p2 = $m.Groups[2].Value.Replace('=', '')
        $k = "$p1$p2"
        if ($prodMap.ContainsKey($k)) {
            return $prodMap[$k]
        }
        return $m.Value
    })

    # Remap list_products pagination URLs
    $text = $listPageRegex.Replace($text, {
        param($m)
        $offset = [int]$m.Groups[1].Value
        $pageNum = [math]::Floor($offset / 12) + 1
        return "AM-products-list-p$pageNum.html"
    })

    # Remap main routes
    $text = $text.Replace('https://agrimart.in/index.php/home/list_products', 'AM-products-list-p1.html')
    $text = $text.Replace('https://agrimart.in/index.php/home/services', 'AM-services.html')
    $text = $text.Replace('https://agrimart.in/index.php/home/terms_conditions', 'AM-terms.html')
    $text = $text.Replace('https://agrimart.in/index.php/home/warranty_policy', 'AM-warranty.html')
    $text = $text.Replace('href="https://agrimart.in/index.php/home/"', 'href="index.html"')
    $text = $text.Replace('href="https://agrimart.in/index.php/home"', 'href="index.html"')
    $text = $text.Replace('href="https://agrimart.in/"', 'href="index.html"')
    $text = $text.Replace('href="https://agrimart.in"', 'href="index.html"')

    # Also handle JS redirections in scripts
    $text = $text.Replace("'https://agrimart.in/' + 'index.php/home/list_products'", "'AM-products-list-p1.html'")
    $text = $text.Replace('"https://agrimart.in/" + "index.php/home/list_products"', '"AM-products-list-p1.html"')

    # Fix pagination function so clicking pagination in static HTML navigates directly
    $text = $text.Replace('function pagination(url) {', "function pagination(url) { if (url && url !== '#') { window.location.href = url; return false; }")

    if ($text -ne $orig) {
        [System.IO.File]::WriteAllText($h.FullName, $text, [System.Text.Encoding]::UTF8)
        $modifiedCount++
    }
}

Write-Host "Updated links in $modifiedCount HTML files."

# 3. Create vercel.json for clean routing
$rewrites = @(
    @{ source = "/"; destination = "/index.html" },
    @{ source = "/products"; destination = "/AM-products-list-p1.html" },
    @{ source = "/services"; destination = "/AM-services.html" },
    @{ source = "/terms"; destination = "/AM-terms.html" },
    @{ source = "/warranty"; destination = "/AM-warranty.html" },
    @{ source = "/index.php/home/list_products"; destination = "/AM-products-list-p1.html" },
    @{ source = "/index.php/home/services"; destination = "/AM-services.html" },
    @{ source = "/index.php/home/terms_conditions"; destination = "/AM-terms.html" },
    @{ source = "/index.php/home/warranty_policy"; destination = "/AM-warranty.html" },
    @{ source = "/index.php/home"; destination = "/index.html" },
    @{ source = "/index.php/home/"; destination = "/index.html" }
)

# Add pagination rewrites for /index.php/home/list_products/:offset
for ($i = 1; $i -le 19; $i++) {
    $offset = ($i - 1) * 12
    $rewrites += @{
        source      = "/index.php/home/list_products/$offset"
        destination = "/AM-products-list-p$i.html"
    }
    $rewrites += @{
        source      = "/products/page/$i"
        destination = "/AM-products-list-p$i.html"
    }
}

$vercelConfig = @{
    cleanUrls = $true
    rewrites  = $rewrites
} | ConvertTo-Json -Depth 5

[System.IO.File]::WriteAllText((Join-Path $workspace "vercel.json"), $vercelConfig, [System.Text.Encoding]::UTF8)
Write-Host "Created vercel.json with clean rewrites."

Remove-Item (Join-Path $workspace "test-map.ps1") -Force -ErrorAction SilentlyContinue
