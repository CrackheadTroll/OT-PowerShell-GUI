#ma pidin eesti keelse klava selle jaoks laadima bruuuuuuuuuuuuuuuhhhhh
#shoutout harle fr 


# assembly tüüpide lisamine
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.ServiceProcess


#loo aken
$form = New-Object System.Windows.Forms.Form
$form.Text = "The Buttfucker 3000"
$form.Size = New-Object System.Drawing.Size(400, 600) 
$form.StartPosition = "CenterScreen"


#tab kontroll
$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Dock = "Fill"
$tabControl.TabPages.Clear()


#programmi sulgemis lehekülg
$taskmanager = New-Object System.Windows.Forms.TabPage
$taskmanager.Text = "Redundancy task manager"
$taskmanager.BackColor="#110015"
$taskmanager.ForeColor="#d3d3d3"


#programmide allalaadimise lehekülg
$niniteclone = New-Object System.Windows.Forms.TabPage
$niniteclone.Text = "A shitter version of ninite"
$niniteclone.BackColor="#110015"
$niniteclone.ForeColor="#d3d3d3"


#diagnoostikaleht
$diagnosticspage = New-Object System.Windows.Forms.TabPage
$diagnosticspage.Text = "Diagnostics"
$diagnosticspage.BackColor="#110015"
$diagnosticspage.ForeColor="#d3d3d3"


#pane lehed tabkontrolli
$tabControl.TabPages.Add($taskmanager)
$tabControl.TabPages.Add($niniteclone)
$tabControl.TabPages.Add($diagnosticspage)




#task manager teenuste staatused
$serviceLabel = New-Object System.Windows.Forms.Label
$serviceLabel.Text = "Or choose a service to view status:"
$serviceLabel.Location = New-Object System.Drawing.Point(10, 200)
$serviceLabel.Size = New-Object System.Drawing.Size(200, 20)
$serviceComboBox = New-Object System.Windows.Forms.ComboBox
$serviceComboBox.Location = New-Object System.Drawing.Point(10, 220)
$serviceComboBox.Size = New-Object System.Drawing.Size(200, 20)

#listi kõik teenused
$services = Get-Service | Select-Object -ExpandProperty Name
$serviceComboBox.Items.AddRange($services)
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Service Status:"
$statusLabel.Location = New-Object System.Drawing.Point(10, 250)
$statusLabel.Size = New-Object System.Drawing.Size(100, 260)
$statusValueLabel = New-Object System.Windows.Forms.Label
$statusValueLabel.Location = New-Object System.Drawing.Point(120, 250)
$statusValueLabel.Size = New-Object System.Drawing.Size(100, 20)

#kontrollid task manageri klooni jaoks
$taskmanager.Controls.Add($serviceLabel)
$taskmanager.Controls.Add($serviceComboBox)
$taskmanager.Controls.Add($statusLabel)
$taskmanager.Controls.Add($statusValueLabel)

#teenuse valimise sündmused
$serviceComboBox.Add_SelectedIndexChanged({
    $selectedService = $serviceComboBox.SelectedItem
    $selectedService =
    $serviceStatus = (Get-Service -Name $selectedService).Status
    $statusValueLabel.Text = $serviceStatus
})




#task manager nupud jms
$TMLabel = New-Object System.Windows.Forms.Label
$TMLabel.Text = "Enter task name or PID:"
$TMLabel.Location = New-Object System.Drawing.Point(10, 20)
$TMLabel.Size = New-Object System.Drawing.Size(150, 20)
$TMTextBox = New-Object System.Windows.Forms.TextBox
$TMTextBox.Location = New-Object System.Drawing.Point(10, 40)
$TMTextBox.Size = New-Object System.Drawing.Size(200, 20)
$TMTextBox.BackColor="#301934"
$TMButton = New-Object System.Windows.Forms.Button
$TMButton.Text = "Kill Task"
$TMButton.Location = New-Object System.Drawing.Point(10, 100)
$TMButton.Size = New-Object System.Drawing.Size(100, 30)
$TMButton.BackColor="#301934"
$TMButton.Add_Click({
    $taskName = $TMTextBox.Text
    if ($taskName) {
        try {
            Get-Process -Name $taskName -ErrorAction Stop | Stop-Process -Force
            [System.Windows.Forms.MessageBox]::Show("Task '$taskName' killed successfully.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Failed to kill task '$taskName'. Error: $_", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
        $TMTextBox.Text = ""
    }
})


#taskmanager kontrollid
$taskmanager.Controls.Add($TMLabel)
$taskmanager.Controls.Add($TMTextBox)
$taskmanager.Controls.Add($TMButton)


#ninite kontrollid
$appLabel = New-Object System.Windows.Forms.Label
$appLabel.Text = "Choose Programs:"
$appLabel.Location = New-Object System.Drawing.Point(10, 20)
$appLabel.Size = New-Object System.Drawing.Size(200, 20)
$CBBitTorrent = New-Object System.Windows.Forms.CheckBox
$CBBitTorrent.Text = "BitTorrent"
$CBBitTorrent.Location = New-Object System.Drawing.Point(10, 50)
$CBBitTorrent.Size = New-Object System.Drawing.Size(150, 20)
$CBDiscord = New-Object System.Windows.Forms.CheckBox
$CBDiscord.Text = "Discord"
$CBDiscord.Location = New-Object System.Drawing.Point(10, 80)
$CBDiscord.Size = New-Object System.Drawing.Size(150, 20)
$CBSteam = New-Object System.Windows.Forms.CheckBox
$CBSteam.Text = "Steam"
$CBSteam.Location = New-Object System.Drawing.Point(10, 110)
$CBSteam.Size = New-Object System.Drawing.Size(150, 20)
$CBOperaGX = New-Object System.Windows.Forms.CheckBox
$CBOperaGX.Text = "Opera GX"
$CBOperaGX.Location = New-Object System.Drawing.Point(10, 140)
$CBOperaGX.Size = New-Object System.Drawing.Size(150, 20)
$CBVTuberMaker = New-Object System.Windows.Forms.CheckBox
$CBVTuberMaker.Text = "VTuber Maker"
$CBVTuberMaker.Location = New-Object System.Drawing.Point(10, 170)
$CBVTuberMaker.Size = New-Object System.Drawing.Size(150, 20)
$downloadButton = New-Object System.Windows.Forms.Button
$downloadButton.Text = "install"
$downloadButton.Location = New-Object System.Drawing.Point(10, 200)
$downloadButton.Size = New-Object System.Drawing.Size(150, 30)
$downloadButton.BackColor="#301934"
$downloadButton.Add_Click({
    if ($CBBitTorrent.Checked) {
        Start-Process -FilePath "https://www.bittorrent.com/downloads/complete/"
    }
    if ($CBDiscord.Checked) {
        Start-Process -FilePath "https://discord.com/api/download?platform=win"
    }
    if ($CBSteam.Checked) {
        Start-Process -FilePath "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
    }
    if ($CBOperaGX.Checked) {
        Start-Process -FilePath "https://www.opera.com/computer/thanks?ni=eapgx&os=windows&utm_source=yt&utm_medium=yt_influencers&utm_campaign=c24_yt_gx_us_TheRussianBadger"
    }
    if ($CBVTuberMaker.Checked) {
        Start-Process -FilePath "https://live3d-global.zingfront.com/vtuber/product/VTuber_Maker_v1.7.8_Setup.exe"
    }
    [System.Windows.Forms.MessageBox]::Show("Your applications are being downloaded.", "Yipee", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})


# Lisage rakenduse allalaadimislehele juhtnööre
$niniteclone.Controls.Add($appLabel)
$niniteclone.Controls.Add($CBBitTorrent)
$niniteclone.Controls.Add($CBDiscord)
$niniteclone.Controls.Add($CBSteam)
$niniteclone.Controls.Add($CBOperaGX)
$niniteclone.Controls.Add($CBVTuberMaker)
$niniteclone.Controls.Add($downloadButton)


# Looge juhtimisseadmed väljalülitusvalikute lehele
$diagnosticslabel = New-Object System.Windows.Forms.Label
$diagnosticslabel.Text = "Avalible diagnostic options:"
$diagnosticslabel.Location = New-Object System.Drawing.Point(10, 20)
$diagnosticslabel.Size = New-Object System.Drawing.Size(200, 20)


#nupp arvuti restartimiseks
$rebootButton = New-Object System.Windows.Forms.Button
$rebootButton.Text = "Reboot"
$rebootButton.Location = New-Object System.Drawing.Point(10, 50)
$rebootButton.Size = New-Object System.Drawing.Size(100, 30)
$rebootButton.BackColor="#110015"
$rebootButton.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Ya sure, buddy?", "Confirm Restart", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning) -eq [System.Windows.Forms.DialogResult]::Yes) {
        Restart-Computer -Force
    }
})


#nupp kontost välja logimiseks
$logOutButton = New-Object System.Windows.Forms.Button
$logOutButton.Text = "Log Out"
$logOutButton.Location = New-Object System.Drawing.Point(10, 90)
$logOutButton.Size = New-Object System.Drawing.Size(100, 30)
$logOutButton.BackColor="#110015"
$logOutButton.Add_Click({
    if ([System.Windows.Forms.MessageBox]::Show("Sure you wanna log out?", "Confirm log out", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning) -eq [System.Windows.Forms.DialogResult]::Yes) {
        shutdown.exe /l /f
    }
})


#nupp ajutiste failide ja prügi kustutamiseks
$emptyRecycleBinButton = New-Object System.Windows.Forms.Button
$emptyRecycleBinButton.Text = "Clear Trash and Temp"
$emptyRecycleBinButton.Location = New-Object System.Drawing.Point(10, 130)
$emptyRecycleBinButton.Size = New-Object System.Drawing.Size(150, 30)
$emptyRecycleBinButton.BackColor="#110015"
$emptyRecycleBinButton.Add_Click({
    Clear-RecycleBin -Force
    Remove-Item "C:\Windows\Temp" -Recurse
})


#nupp arvuti magama panemiseks
$sleepButton = New-Object System.Windows.Forms.Button
$sleepButton.Text = "Sleep"
$sleepButton.Location = New-Object System.Drawing.Point(10, 170)
$sleepButton.Size = New-Object System.Drawing.Size(100, 30)
$sleepButton.BackColor="#110015"
$sleepButton.Add_Click({
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::SetSuspendState([System.Windows.Forms.PowerState]::Suspend, $false, $true)
})
#diagnoostikalehe kontrollid
$diagnosticspage.Controls.Add($diagnosticslabel)
$diagnosticspage.Controls.Add($rebootButton)
$diagnosticspage.Controls.Add($logOutButton)
$diagnosticspage.Controls.Add($emptyRecycleBinButton)
$diagnosticspage.Controls.Add($sleepButton)


#tab kontrollid
$form.Controls.Add($tabControl)

#näita akent
$form.Add_Shown({ $form.Activate() })
$form.ShowDialog() | Out-Null


#https://info.publicintelligence.net/EpsteinDocs-Batch8.pdf
#off the rip with the hard questions...