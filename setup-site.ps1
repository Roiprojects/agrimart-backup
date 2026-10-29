$workspace = "c:\Users\HP\Desktop\Agrimart-backup"

function Ensure-Dir($dir) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

function Copy-Asset($srcName, $relDst) {
    $src = Join-Path $workspace $srcName
    $dst = Join-Path $workspace $relDst
    $dstDir = Split-Path $dst -Parent
    Ensure-Dir $dstDir
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $dst -Force
    }
}

# 1. index.html
Copy-Item (Join-Path $workspace "Agrimart-backup-index.html") (Join-Path $workspace "index.html") -Force

# 2. CSS Files
Copy-Asset "Agrimart-backup-css-animate.css" "assests\theme_1\css\animate.css"
Copy-Asset "Agrimart-backup-css-animate.css" "assests\css\animate.css"
Copy-Asset "Agrimart-backup-css-bootstrap.min.css" "assests\theme_1\css\bootstrap.min.css"
Copy-Asset "Agrimart-backup-css-easy-autocomplete.min.css" "assests\css\easy-autocomplete.min.css"
Copy-Asset "Agrimart-backup-css-easy-autocomplete.min.css" "assests\plugin\EasyAutocomplete\easy-autocomplete.css"
Copy-Asset "Agrimart-backup-css-font-awesome.css" "assests\theme_1\css\font-awesome.css"
Copy-Asset "Agrimart-backup-css-jquery.fancybox.css" "assests\css\jquery.fancybox.css"
Copy-Asset "Agrimart-backup-css-magnific-popup.css" "assests\theme_1\css\magnific-popup.css"
Copy-Asset "Agrimart-backup-css-main.css" "assests\theme_1\css\main.css"
Copy-Asset "Agrimart-backup-css-megamenu.css" "assests\theme_1\css\megamenu.css"
Copy-Asset "Agrimart-backup-css-myaccount.css" "assests\css\myaccount.css"
Copy-Asset "Agrimart-backup-css-product_display.css" "assests\css\product_display.css"
Copy-Asset "Agrimart-backup-css-responsive.css" "assests\theme_1\css\responsive.css"
Copy-Asset "Agrimart-backup-css-rev-layers.css" "assests\theme_1\revolution\css\layers.css"
Copy-Asset "Agrimart-backup-css-rev-settings.css" "assests\theme_1\revolution\css\settings.css"
Copy-Asset "Agrimart-backup-css-shortcodes.css" "assests\theme_1\css\shortcodes.css"
Copy-Asset "Agrimart-backup-css-slick-theme.css" "assests\theme_1\css\slick-theme.css"
Copy-Asset "Agrimart-backup-css-slick.css" "assests\theme_1\css\slick.css"
Copy-Asset "Agrimart-backup-css-themify-icons.css" "assests\theme_1\css\themify-icons.css"
Copy-Asset "Agrimart-backup-css-xzoom.css" "assests\css\xzoom.css"

# 3. Image Files
Copy-Asset "Agrimart-backup-img-apple.png" "assests\theme_1\images\apple.png"
Copy-Asset "Agrimart-backup-img-award-01.jpg" "assests\theme_1\images\awards\badge\01.jpg"
Copy-Asset "Agrimart-backup-img-award-02.jpg" "assests\theme_1\images\awards\badge\02.jpg"
Copy-Asset "Agrimart-backup-img-award-03.jpg" "assests\theme_1\images\awards\badge\03.jpg"
Copy-Asset "Agrimart-backup-img-award-04.jpg" "assests\theme_1\images\awards\badge\04.jpg"
Copy-Asset "Agrimart-backup-img-award-05.jpg" "assests\theme_1\images\awards\badge\05.jpg"
Copy-Asset "Agrimart-backup-img-award-06.jpg" "assests\theme_1\images\awards\badge\06.jpg"
Copy-Asset "Agrimart-backup-img-award-07.jpg" "assests\theme_1\images\awards\badge\07.jpg"
Copy-Asset "Agrimart-backup-img-banner-03.jpg" "assests\theme_1\images\slides\banner-03.jpg"
Copy-Asset "Agrimart-backup-img-banner-04.jpg" "assests\theme_1\images\slides\banner-04.jpg"
Copy-Asset "Agrimart-backup-img-banner-05.jpg" "assests\theme_1\images\slides\banner-05.jpg"
Copy-Asset "Agrimart-backup-img-brand_1.jpeg" "uploads\brand_image\1\brand_1.jpeg"
Copy-Asset "Agrimart-backup-img-brand_12.jpeg" "uploads\brand_image\1\brand_12.jpeg"
Copy-Asset "Agrimart-backup-img-brand_2.jpeg" "uploads\brand_image\1\brand_2.jpeg"
Copy-Asset "Agrimart-backup-img-brand_3.jpg" "uploads\brand_image\1\brand_3.jpg"
Copy-Asset "Agrimart-backup-img-google.png" "assests\theme_1\images\google.png"
Copy-Asset "Agrimart-backup-img-icon_new.png" "assests\theme_1\images\icon_new.png"
Copy-Asset "Agrimart-backup-img-logo.png" "assests\theme_1\images\logo.png"
Copy-Asset "Agrimart-backup-img-logo.png" "assests\theme_1\images\favicon.png"
Copy-Asset "Agrimart-backup-img-our_network.jpg" "assests\theme_1\images\our_network.jpg"
Copy-Asset "Agrimart-backup-img-pro-01-plus.png" "assests\theme_1\images\product\pro-01-plus.png"
Copy-Asset "Agrimart-backup-img-pro-02-plus.png" "assests\theme_1\images\product\pro-02-plus.png"
Copy-Asset "Agrimart-backup-img-pro-03-plus.png" "assests\theme_1\images\product\pro-03-plus.png"
Copy-Asset "Agrimart-backup-img-pro-04-plus.png" "assests\theme_1\images\product\pro-04-plus.png"
Copy-Asset "Agrimart-backup-img-pro-05-plus.png" "assests\theme_1\images\product\pro-05-plus.png"
Copy-Asset "Agrimart-backup-img-rec-angrau.jpg" "assests\theme_1\images\awards\badge\angrau.jpg"
Copy-Asset "Agrimart-backup-img-rec-ciae.jpg" "assests\theme_1\images\awards\badge\ciae.jpg"
Copy-Asset "Agrimart-backup-img-rec-nerfmtti.jpg" "assests\theme_1\images\awards\badge\nerfmtti.jpg"
Copy-Asset "Agrimart-backup-img-rec-nrfmtti.jpg" "assests\theme_1\images\awards\badge\nrfmtti.jpg"
Copy-Asset "Agrimart-backup-img-rec-srfmtti.jpg" "assests\theme_1\images\awards\badge\srfmtti.jpg"
Copy-Asset "Agrimart-backup-img-rec-tnau.jpg" "assests\theme_1\images\awards\badge\tnau.jpg"
Copy-Asset "Agrimart-backup-img-rec-uas.jpg" "assests\theme_1\images\awards\badge\uas.jpg"

# 4. JS Files
Copy-Asset "Agrimart-backup-js-bootstrap.min.js" "assests\theme_1\js\bootstrap.min.js"
Copy-Asset "Agrimart-backup-js-easyzoom.js" "assests\theme_1\js\easyzoom.js"
Copy-Asset "Agrimart-backup-js-features.js" "assests\theme_1\js\features.js"
Copy-Asset "Agrimart-backup-js-icheck.js" "assests\js\icheck.js"
Copy-Asset "Agrimart-backup-js-jquery-1.11.2.min.js" "assests\theme_1\js\jquery-1.11.2.min.js"
Copy-Asset "Agrimart-backup-js-jquery-validate.js" "assests\theme_1\js\jquery-validate.js"
Copy-Asset "Agrimart-backup-js-jquery-waypoints.js" "assests\theme_1\js\jquery-waypoints.js"
Copy-Asset "Agrimart-backup-js-jquery.easing.js" "assests\theme_1\js\jquery.easing.js"
Copy-Asset "Agrimart-backup-js-jquery.easy-autocomplete.js" "assests\plugin\EasyAutocomplete\jquery.easy-autocomplete.js"
Copy-Asset "Agrimart-backup-js-jquery.easy-autocomplete.min.js" "assests\js\jquery.easy-autocomplete.min.js"
Copy-Asset "Agrimart-backup-js-jquery.magnific-popup.min.js" "assests\theme_1\js\jquery.magnific-popup.min.js"
Copy-Asset "Agrimart-backup-js-jquery.min.js" "assests\theme_1\js\jquery.min.js"
Copy-Asset "Agrimart-backup-js-jquery.noty.packaged.js" "assests\js\jquery.noty.packaged.js"
Copy-Asset "Agrimart-backup-js-jquery.slimscroll.js" "assests\js\jquery.slimscroll.js"
Copy-Asset "Agrimart-backup-js-jquery.themepunch.revolution.min.js" "assests\theme_1\revolution\js\jquery.themepunch.revolution.min.js"
Copy-Asset "Agrimart-backup-js-jquery.themepunch.tools.min.js" "assests\theme_1\revolution\js\jquery.themepunch.tools.min.js"
Copy-Asset "Agrimart-backup-js-main.js" "assests\theme_1\js\main.js"
Copy-Asset "Agrimart-backup-js-megamenu.js" "assests\theme_1\js\megamenu.js"
Copy-Asset "Agrimart-backup-js-notify.min.js" "assests\js\notify.min.js"
Copy-Asset "Agrimart-backup-js-numinate.min.js" "assests\theme_1\js\numinate.min.js"
Copy-Asset "Agrimart-backup-js-price_range_script.js" "assests\theme_1\js\price_range_script.js"
Copy-Asset "Agrimart-backup-js-rev.ext.actions.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.actions.min.js"
Copy-Asset "Agrimart-backup-js-rev.ext.carousel.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.carousel.min.js"
Copy-Asset "Agrimart-backup-js-rev.ext.kenburn.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.kenburn.min.js"
Copy-Asset "Agrimart-backup-js-rev.ext.layeranimation.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.layeranimation.min.js"
Copy-Asset "Agrimart-backup-js-rev.ext.migration.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.migration.min.js"
Copy-Asset "Agrimart-backup-js-rev.ext.navigation.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.navigation.min.js"
Copy-Asset "Agrimart-backup-js-rev.ext.parallax.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.parallax.min.js"
Copy-Asset "Agrimart-backup-js-rev.ext.slideanims.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.slideanims.min.js"
Copy-Asset "Agrimart-backup-js-rev.ext.video.min.js" "assests\theme_1\revolution\js\extensions\revolution.extension.video.min.js"
Copy-Asset "Agrimart-backup-js-slick.js" "assests\theme_1\js\slick.js"
Copy-Asset "Agrimart-backup-js-slider.js" "assests\theme_1\revolution\js\slider.js"
Copy-Asset "Agrimart-backup-js-tether.min.js" "assests\theme_1\js\tether.min.js"

Write-Host "Site assets organized successfully."
