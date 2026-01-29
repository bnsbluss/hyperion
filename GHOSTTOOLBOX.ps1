# ==========================================
# AUTO INSTALLER SILENT MODE BY HYPERION
# POWERSHELL FULL VERSION
# ==========================================

# ---------- BYPASS SECURITY POLICY ----------
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# ---------- ADMIN CHECK ----------
$IsAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $IsAdmin) {
    Start-Process powershell `
        -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" `
        -Verb RunAs
    exit
}

# Jika belum dijalankan di jendela baru
if (-not $env:PS_NEW_WINDOW) {

    # Disable QuickEdit (permanent)
    reg add HKCU\Console /v QuickEdit /t REG_DWORD /d 0 /f | Out-Null

    # Tandai agar tidak loop
    $env:PS_NEW_WINDOW = "1"

    # Buka PowerShell di jendela baru
    Start-Process powershell.exe -ArgumentList "-NoExit -File `"$PSCommandPath`""

    exit
}


# ---------- BASE PATH (ANTI DRIVE CHANGE) ----------
$ScriptRoot = if ($PSCommandPath) {
    Split-Path -Parent $PSCommandPath
} else {
    Get-Location
}

# ---------- CONSOLE SETUP ----------
$cols  = 120
$lines = 40
$rawUI = $Host.UI.RawUI
$rawUI.BufferSize = New-Object Management.Automation.Host.Size($cols, 300)
$rawUI.WindowSize = New-Object Management.Automation.Host.Size($cols, $lines)
$rawUI.BackgroundColor = "Black"
$rawUI.ForegroundColor = "Blue"
$rawUI.WindowTitle = "HYPERION GHOST TOOL"
Clear-Host

#Write-Host "EXPLOIT LOADED HYPERION GHOST TOOL" -ForegroundColor Green
for ($i = 1; $i -le 100; $i++) {
    Write-Progress -Activity "Initializing" -Status "$i / 100%" -PercentComplete $i
    Start-Sleep -Milliseconds 10
}
Write-Progress -Completed -Activity "Done"

# ---------- FUNCTIONS ----------
function Show-Banner {
    Clear-Host
	Write-Host ""
	Write-Host ("=" * 114) -ForegroundColor Cyan
    Write-Host @"
  ██╗            ░░      ░░░  ░░░░  ░░░      ░░░░      ░░░        ░░░░░░░░        ░░░      ░░░░      ░░░  ░░░░░░░░
  ╚██╗           ▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒▒▒▒▒
   ╚██╗          ▓  ▓▓▓   ▓▓        ▓▓  ▓▓▓▓  ▓▓▓      ▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓  ▓▓  ▓▓▓▓▓▓▓▓
   ██╔╝          █  ████  ██  ████  ██  ████  ████████  █████  ██████████████  █████  ████  ██  ████  ██  ████████
  ██╔╝███████╗   ██      ███  ████  ███      ████      ██████  ██████████████  ██████      ████      ███        ██
  ╚═╝ ╚══════╝   █████████████████████████████████████████████████████████████████████████████████████████████████
"@ -ForegroundColor Gray

    Write-Host ("=" * 114) -ForegroundColor Cyan
    Write-Host ""
}

# ---------- MENAMPILKAN ANIMASI LOADING ----------
function Show-Loading($Text, $Steps = 30) {
    for ($i = 1; $i -le $Steps; $i++) {
        Write-Progress -Activity $Text -Status "$i / $Steps" -PercentComplete (($i / $Steps) * 100)
        Start-Sleep -Milliseconds 10
    }
    Write-Progress -Completed -Activity $Text
}

# ---------- PEMANGGIL WINDOWS UPDATE DISABLE ----------
function Disable-WindowsUpdate {
	$WubD = Join-Path $ScriptRoot "WubD.ini"
	$WubA = Join-Path $ScriptRoot "Wub.ini"
	$WinU = Join-Path $ScriptRoot "Win_Update_Disabled_v1.7.zip"
	copy "$WinU" "$env:USERPROFILE\Downloads\Win_Update_Disabled.zip"
	copy "$WubD" "$WubA"
    Write-Host "Disabling Windows Update..." -ForegroundColor Yellow
#    Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
#    Set-Service wuauserv -StartupType Disabled
	WindowsDisabledApp "Wub_x64.exe" "/D /P" "Windows Update Disabled"
}

# ---------- PEMANGGIL WINDOWS UPDATE DISABLE ----------
function Enabled-WindowsUpdate {
	$WubE = Join-Path $ScriptRoot "WubE.ini"
	$WubA = Join-Path $ScriptRoot "Wub.ini"
	copy "$WubE" "$WubA"
    Write-Host "Enabling Windows Update..." -ForegroundColor Yellow
#    Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
#    Set-Service wuauserv -StartupType Disabled
	WindowsDisabledApp "Wub_x64.exe" "/E /P" "Windows Update Enabled"
}

# ---------- INSTALL MS OFFICE ----------
function MSOffice {
    Write-Host "Setup - Microsoft Office 2019/2020/2021" -ForegroundColor Yellow
#    Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
#    Set-Service wuauserv -StartupType Disabled
	Install-App "SetupOffice.exe" "/S" "Microsoft Office"
}

# ---------- PROGGRESS WINDOWS UPDATE DISABLE ----------
function WindowsDisabledApp {
    param (
        [Parameter(Mandatory)]
        [string]$Exe,

        [string]$Args,

        [Parameter(Mandatory)]
        [string]$Name
    )

    $InstallerPaths = Join-Path $PSScriptRoot $Exe

    if (-not (Test-Path $InstallerPaths)) {
        Write-Host "Windows Updater Blocker not found: $InstallerPaths" -ForegroundColor Red
        Start-Sleep 1
        return
    }

    Show-Banner
    if ([string]::IsNullOrWhiteSpace($Args)) {
        $proc = Start-Process $InstallerPaths -PassThru -WindowStyle Hidden
    } else {
        $proc = Start-Process $InstallerPaths -ArgumentList $Args -PassThru -WindowStyle Hidden
    }

    # 🔄 Loading animasi selama installer berjalan
	Write-Host ">_ Checking $Name" -ForegroundColor Green
    Show-WinUpdateD -Process $proc -Text "Background Proggress $Name"

    # ⏳ Pastikan benar-benar selesai
    try {
        $proc.WaitForExit()
    } catch {
        Wait-Process -Id $proc.Id
    }

    Start-Sleep -Milliseconds 1200
}

# ---------- MENAMPILKAN ANIMASI WINDOWS UPDATE DISABLE ----------
function Show-WinUpdateD {
    param (
        [System.Diagnostics.Process]$Process,
        [string]$Text
    )

    $spinner = @('|','/','-','\')
    $i = 0

    while (-not $Process.HasExited) {
        $char = $spinner[$i % $spinner.Count]
        Write-Host -NoNewline "`r$Text... $char"
        Start-Sleep -Milliseconds 50
        $i++
    }
	Show-Banner
	Write-Host "Done - $Name " -ForegroundColor Cyan
	Start-Sleep -Milliseconds 1000
}


function Kill-Process($Name) {
    Stop-Process -Name $Name -Force -ErrorAction SilentlyContinue
}

# ---------- FUNGSI INSTALL APP ----------
function Install-App {
    param (
        [Parameter(Mandatory)]
        [string]$Exe,

        [string]$Args,

        [Parameter(Mandatory)]
        [string]$Name
    )

    $InstallerPath = Join-Path $PSScriptRoot $Exe

    if (-not (Test-Path $InstallerPath)) {
        Write-Host "Installer not found: $InstallerPath" -ForegroundColor Red
        Start-Sleep 1
        return
    }

    Show-Banner
    if ([string]::IsNullOrWhiteSpace($Args)) {
        $proc = Start-Process $InstallerPath -PassThru -WindowStyle Hidden
    } else {
        $proc = Start-Process $InstallerPath -ArgumentList $Args -PassThru -WindowStyle Hidden
    }

    # 🔄 Loading animasi selama installer berjalan
	Write-Host ">_ Installing $Name" -ForegroundColor Green
    Show-LoadingBar -Process $proc -Text "Background Progress -  $Name"

    # ⏳ Pastikan benar-benar selesai
    try {
        $proc.WaitForExit()
    } catch {
        Wait-Process -Id $proc.Id
    }

    Start-Sleep -Milliseconds 1200
}

# ---------- ANIMASI LOADING BAR ----------
function Show-LoadingBar {
    param (
        [System.Diagnostics.Process]$Process,
        [string]$Text
    )

    $spinner = @('|','/','-','\')
    $i = 0

    while (-not $Process.HasExited) {
        $char = $spinner[$i % $spinner.Count]
        Write-Host -NoNewline "`r$Text... $char"
        Start-Sleep -Milliseconds 50
        $i++
    }
	Show-Banner
	Write-Host ">_ Installing $Name Complete" -ForegroundColor Cyan
	Start-Sleep -Milliseconds 1000
}


# ---------- PEMANGGIL INSTALLER / SETUP SILENT INSTALL ----------
function Install-Applications {

	Install-App "Chrome64.exe" "/silent /install" "Google Chrome"
	Kill-Process "chrome"
	
	Install-App "Aim.exe" "/AUTO /SILENT" "Aim Player"
	Kill-Process "SystemSettings"
	
	Install-App "AdobeReader.exe" "/sAll /rs /msi EULA_ACCEPT=YES" "Adobe Acrobat Reader"
	Kill-Process "Acrobat"
	
	Install-App "UltraViewer_setup_6.5_en.exe" "/VERYSILENT /NORESTART" "Ultra Viewer 6.5"
	
	Install-App "Installer.exe" "/silent" "Zoom Workplace"
	Kill-Process "zoom"
	
	Install-App "vlc-3.0.21-win32.exe" "/S" "VLC Media Player"
	
	Install-App "setup.exe" "/S" "Mozilla Firefox"
	
	Install-App "winrar.exe" "/S" "WinRAR English"
	
	Create-Shortcut "Zoom" "$env:APPDATA\Zoom\bin\Zoom.exe"
	
	# ============= BUAT SHORTCUT MS OFFICE ==================
	Create-Shortcut "PowerPoint" "$env:ProgramFiles\Microsoft Office\root\Office16\POWERPNT.EXE"
	Create-Shortcut "Excel" "$env:ProgramFiles\Microsoft Office\root\Office16\EXCEL.EXE"
	Create-Shortcut "Word" "$env:ProgramFiles\Microsoft Office\root\Office16\WINWORD.EXE"
}

# ---------- FUNGSI UNTUK BUAT SHORTCUT ----------
function Create-Shortcut($Name, $Target, $Icon = $null) {
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\$Name.lnk")
    $Shortcut.TargetPath = $Target
    if ($Icon) { $Shortcut.IconLocation = $Icon }
    $Shortcut.Save()
}

# ---------- PEMANGGIL SCRIPT AUTO SHORTCUT ----------
function AutoShortcut {
    Clear-Host
    Show-Loading "Creating Shortcut - Please Wait.." 50
	$YT = Join-Path $ScriptRoot "YouTube.ico"
    if (-not (Test-Path $YT)) {
        Write-Host "YouTube.ico not found!" -ForegroundColor Red
        Read-Host "Press ENTER"
        return
    }
	copy $YT "$env:USERPROFILE\AppData\Local\YouTube.ico"
	Create-Shortcut "PowerPoint" "$env:ProgramFiles\Microsoft Office\root\Office16\POWERPNT.EXE"
	Create-Shortcut "Excel" "$env:ProgramFiles\Microsoft Office\root\Office16\EXCEL.EXE"
	Create-Shortcut "Word" "$env:ProgramFiles\Microsoft Office\root\Office16\WINWORD.EXE"
	Create-Shortcut "Aktivasi Office Home 2024" "$env:ProgramFiles\Google\Chrome\Application\chrome.exe" "$env:USERPROFILE\AppData\Local\YouTube.ico"
    #"https://youtu.be/l1mRU5rezPo?si=RtujBdhOK8Q0Rlcy"
	Create-Shortcut -Name "Aktivasi Office Home 2024" -Target "https://youtu.be/l1mRU5rezPo?si=RtujBdhOK8Q0Rlcy" -Icon "$env:USERPROFILE\AppData\Local\YouTube.ico"
}

# ---------- UTILITIES ----------
function Show-Serial {
    try {
        $sn = (Get-CimInstance Win32_BIOS).SerialNumber
        if (-not $sn) { throw "Serial Number not Found" }

        $file = "$env:TEMP\SerialNumber.txt"
        "Serial Number: $sn" | Out-File $file -Encoding UTF8
        Start-Process notepad.exe $file
    } catch {
        Write-Host "Failed Get Serial Number." -ForegroundColor Red
        Read-Host "Press ENTER"
    }
}

# ---------- MENAMPILKAN SYSTEM INFO ----------
function Show-SystemInfo {
    Clear-Host
    Show-Loading "Initializing" 100
    Get-ComputerInfo | Out-Host
    Read-Host "Press ENTER to return"
}

# ---------- REPAIR WINDOWS ----------
function RepairWindows {
    Clear-Host
    Show-Loading "Initializing" 100
	Write-Host "`n[DISM] Restore Health" -ForegroundColor Cyan
    DISM /Online /Cleanup-Image /RestoreHealth

    Write-Host "`n[SFC] System File Checker" -ForegroundColor Cyan
    sfc /scannow
    Read-Host "Press ENTER to return"
}

# ---------- MEMBUKA DISK MANAGER----------
function Open-DiskMgmt {
    Clear-Host
    Show-Loading "Initializing" 100
    Start-Process diskmgmt.msc
}

# ---------- MEMERIKSA DISK----------
#function CheckDisk {
#    Clear-Host
#    Show-Loading "Initializing" 100
#    chkdsk c: /f /r
#}

function CheckDisk {
    Clear-Host
    # 1. Menampilkan daftar drive yang tersedia agar user tidak bingung
    Write-Host "Checking Available Drive" -ForegroundColor Yellow
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{n="Used(GB)";e={[math]::Round($_.Used/1GB,2)}}, @{n="Free(GB)";e={[math]::Round($_.Free/1GB,2)}} | Format-Table -AutoSize

    # 2. Input Drive Letter dari user
    $drive = Read-Host "`nType the drive letter you want to check (Example: C or D)"
    
    # Validasi jika input kosong
    if (-not $drive) {
        Write-Host "Error: Input cannot be empty!" -ForegroundColor Red
        return
    }

    # 3. Konfirmasi (Perbaikan error di baris ini)
    # Gunakan $($drive) agar PowerShell tidak bingung dengan tanda titik dua
    $confirm = Read-Host "Are you sure you want to run CHKDSK on $($drive): /f /r /x? (Y/N)"
    
    if ($confirm -eq 'Y' -or $confirm -eq 'y') {
        Clear-Host
        Show-Loading "Initializing" 100
        
        # Eksekusi chkdsk
        # Kita gunakan $($drive) lagi di sini untuk keamanan
        chkdsk "$($drive):" /f /r /x
    } else {
        Write-Host "Process canceled by user." -ForegroundColor Yellow
    }
}



# ---------- PEMANGGIL KMS ATAU AKTIVATOR ----------
function CheckData {
    Show-Loading "Initializing" 100

    $kmsFile = Join-Path $ScriptRoot "kms.win"
    $onlineUrl = "https://raw.githubusercontent.com/bnsbluss/hyperion/refs/heads/master/kms.win"

    if (Test-Path $kmsFile) {
        # Jika file lokal ditemukan
        Write-Host "Load file - $kmsFile" -ForegroundColor Cyan
        iex (Get-Content $kmsFile -Raw)
    } 
    else {
        # Jika file lokal TIDAK ditemukan, coba ambil dari internet
        Write-Host "kms.win not found, Try load from server..." -ForegroundColor Yellow
        
        try {
            # Mengambil script dari internet dan menjalankannya
            irm $onlineUrl | iex
        } 
        catch {
            # Jika internet mati atau URL salah
            Write-Host "Failed to load the online file. Please make sure the internet connection is available." -ForegroundColor Red
            Read-Host "Press ENTER"
            return
        }
    }
}
#function CheckData {
#    Show-Loading "Initializing" 100
#
#    $kmsFile = Join-Path $ScriptRoot "kms.win"
#    if (-not (Test-Path $kmsFile)) {
#        Write-Host "kms.win not found!" -ForegroundColor Red
#        Read-Host "Press ENTER"
#        return
#    }
#
#    iex (Get-Content $kmsFile -Raw)
#	irm https://raw.githubusercontent.com/bnsbluss/hyperion/refs/heads/master/kms.win | iex
#}

# ---------- BACKUP DRIVER ----------
function DriverCheckBackup {
    Clear-Host
    Show-Loading "Initializing Driver Check & Backup" 100

    Write-Host "`n[INFO] Installed Driver List:`n" -ForegroundColor Cyan
    Get-WindowsDriver -Online |
        Select-Object Driver, ProviderName, ClassName, Date |
        Sort-Object ClassName |
        Out-Host

    $backupPath = "C:\DriverBackup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

    Write-Host "`n[INFO] Backing up drivers to:" -ForegroundColor Yellow
    Write-Host $backupPath -ForegroundColor Green

    New-Item -ItemType Directory -Path $backupPath -Force | Out-Null

    DISM /Online /Export-Driver /Destination:$backupPath

    Write-Host "`n[SUCCESS] Driver backup completed." -ForegroundColor Green

    Read-Host "Press ENTER to return"
}

# ---------- RESTORE DRIVER ----------
function DriverRestore {
    Clear-Host
    Show-Loading "Initializing Driver Restore" 100

    Write-Host "`n[INFO] Driver Restore Process" -ForegroundColor Cyan
    Write-Host "Enter the folder path for the driver backup" -ForegroundColor Yellow
    Write-Host "Example: C:DriverBackup_20260129_120000`n" -ForegroundColor DarkGray

    $driverPath = Read-Host "Driver Backup Path"

    if (-not (Test-Path $driverPath)) {
        Write-Host "`n[ERROR] Folder not found!" -ForegroundColor Red
        Read-Host "Press ENTER to return"
        return
    }

    Write-Host "`n[INFO] Installing drivers from:" -ForegroundColor Yellow
    Write-Host $driverPath -ForegroundColor Green
    Write-Host "`nPlease wait, installing drivers...`n" -ForegroundColor Cyan

    pnputil /add-driver "$driverPath\*.inf" /subdirs /install

    Write-Host "`n[SUCCESS] Driver restore completed." -ForegroundColor Green
    $reboot = Read-Host "A reboot may be required.? (Y/N)" -ForegroundColor Yellow
	if ($reboot -match '^[Yy]$') {
		Restart-Computer -Force
	}
    Read-Host "Press ENTER to return"
}

function Keluar {
	Clear-Host
	reg add HKCU\Console /v QuickEdit /t REG_DWORD /d 1 /f | Out-Null
	Show-Banner
	Write-Host '[EXIT] You have exit from session ' -NoNewline -ForegroundColor Green
    Write-Host 'Close this terminal.' -ForegroundColor Red
	exit
}

function Main-Menu {
    do {
        # Clear-Host # Opsional: Aktifkan jika ingin menu selalu bersih di atas
        Show-Banner
        Write-Host "+_ROOT" -ForegroundColor Red
		#Write-Host "  │" -ForegroundColor Green
		Write-Host "  ├──>_MENU UTILITIES" -ForegroundColor Cyan
        Write-Host "  │   ├──[1] Silent Install" -ForegroundColor Green
        Write-Host "  │   ├──[2] Serial Number Check" -ForegroundColor Green
        Write-Host "  │   ├──[3] System Info" -ForegroundColor Green
        Write-Host "  │   ├──[4] Disk Management" -ForegroundColor Green
        Write-Host "  │   └──[5] Install MS-Office 19/20/21" -ForegroundColor Green
        Write-Host "  │" -ForegroundColor Green
        Write-Host "  ├──>_WINDOWS TOOLS" -ForegroundColor Cyan
        Write-Host "  │   ├──[D] Disable Windows Update" -ForegroundColor Yellow
        Write-Host "  │   ├──[E] Enable Windows Update" -ForegroundColor Yellow
        Write-Host "  │   ├──[A] Windows Tools Activator" -ForegroundColor Yellow
        Write-Host "  │   ├──[R] Repair Windows (SFC & DISM)" -ForegroundColor Yellow
        Write-Host "  │   └──[F] Check Disk (CHKDSK)" -ForegroundColor Yellow
        Write-Host "  │" -ForegroundColor Green
        Write-Host "  ├──>_OTHER OPTION" -ForegroundColor Cyan
		Write-Host "  │   ├──[B] Driver Check & Backup" -ForegroundColor Yellow
        Write-Host "  │   ├──[T] Driver Restore" -ForegroundColor Yellow
        Write-Host "  │   └──[C] Auto Shortcut" -ForegroundColor Gray
		Write-Host "  │    " -ForegroundColor Green
        Write-Host "  └──────[X] Exit" -ForegroundColor Red
        Write-Host ""
        
        Write-Host "Select Option: " -NoNewline # Menampilkan teks perintah tanpa baris baru
        
        # --- BAGIAN KUNCI: Membaca input tanpa Enter ---
        $input = [Console]::ReadKey($true) 
        $choice = $input.KeyChar.ToString().ToUpper() # Ambil karakter dan ubah ke Huruf Kapital
        
        Write-Host $choice -ForegroundColor White # Menampilkan karakter yang ditekan
        Write-Host "" # Tambah baris baru agar output fungsi berikutnya tidak berantakan

        switch ($choice) { 
            "1" { Install-Applications }
            "2" { Show-Serial }
            "3" { Show-SystemInfo }
            "4" { Open-DiskMgmt }
            "5" { MSOffice }
            "A" { CheckData }
            "D" { Disable-WindowsUpdate }
            "E" { Enabled-WindowsUpdate }
            "R" { RepairWindows}
            "B" { DriverCheckBackup }
            "T" { DriverRestore }
            "C" { AutoShortcut }
            "F" { CheckDisk }
            "X" { Keluar }
            default { 
                Write-Host "Wrong Selected!" -ForegroundColor Red
                Start-Sleep -Milliseconds 500 
            }
        }
    } while ($true)
}

# ---------- START ----------
Main-Menu
