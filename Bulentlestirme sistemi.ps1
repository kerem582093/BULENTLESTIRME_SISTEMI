Add-Type -AssemblyName 'System.Windows.Forms'

# Masaüstündeki dosya sayısını kontrol et
$desktopPath = [Environment]::GetFolderPath('Desktop')
$fileCount = (Get-ChildItem -Path $desktopPath).Count

# 40 klasör oluşturmayı hedefle
$maxFolders = 70

# Klasörleri oluştur
for ($i = 1; $i -le $maxFolders; $i++) {
    $folderName = "$desktopPath\BULENTSAHIN$i"
    
    # Eğer klasör zaten varsa, bir sonraki klasörü oluştur
    if (-not (Test-Path -Path $folderName)) {
        New-Item -ItemType Directory -Path $folderName
    }
}

# Masaüstü arka planını ayarlamak için URL'yi indir ve ayarla
$url = "https://i.imgur.com/goiTn6E.jpeg"
$path = "$env:TEMP\wall.jpg"
Invoke-WebRequest $url -OutFile $path

# Arka planı değiştirmek için gerekli API çağrısını yap
Add-Type '[DllImport("user32.dll")]public static extern bool SystemParametersInfo(int u,int p,string s,int f);' -Name a -Namespace b
[b.a]::SystemParametersInfo(20,0,$path,3)

# URL'yi aç
Start-Process 'https://i.imgur.com/oFJb19f.png'
Start-Sleep -Seconds 2
Start-Process 'https://www.google.com/search?q=uomur+06+ense&oq=uomur+06+ense&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQIRigATIHCAIQIRigAdIBCDM5MzVqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8'

# Video URL'sini aç
Start-Sleep -Seconds 2 # Video URL'sinden önce 2 saniye bekle
Start-Process 'https://www.youtube.com/watch?v=tGjylPp45hk'

# Mesaj kutularını 30 kez göster
Start-Sleep -Seconds 3 # Video ve resim açıldıktan sonra biraz bekle
for ($j = 1; $j -le 60; $j++) {
    [System.Windows.Forms.MessageBox]::Show('BULENTLESTIRME ISLEMI TAMAMLANDI', 'UOmur06 Ense', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}
