function rmbang ($bang) {
    $RmAPI.Bang($bang)
}
function EditAlarm {
    Add-Type -AssemblyName System.Windows.Forms

    # Create a Form with a custom title and size
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Edit Alarm Settings"
    $form.Size = New-Object System.Drawing.Size(350, 550)
    $form.StartPosition = "CenterScreen"
    $form.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)
    $form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false
    # Define a custom font
    $font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Regular)

    # Header label
    $headerLabel = New-Object System.Windows.Forms.Label
    $headerLabel.Text = "Alarm Settings"
    $headerLabel.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
    $headerLabel.ForeColor = [System.Drawing.Color]::DarkSlateGray
    $headerLabel.Size = New-Object System.Drawing.Size(300, 30)
    $headerLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
    $headerLabel.Location = New-Object System.Drawing.Point(25, 10)
    $form.Controls.Add($headerLabel)

    # Day Checkboxes Group
    $daysGroupBox = New-Object System.Windows.Forms.GroupBox
    $daysGroupBox.Text = "Days"
    $daysGroupBox.Font = $font
    $daysGroupBox.Size = New-Object System.Drawing.Size(300, 280)
    $daysGroupBox.Location = New-Object System.Drawing.Point(20, 50)
    $daysGroupBox.BackColor = [System.Drawing.Color]::WhiteSmoke
    $form.Controls.Add($daysGroupBox)

    # Define checkboxes for each day with a sleeker layout
    $days = @("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
    $controls = @{}
    for ($i = 0; $i -lt $days.Length; $i++) {
        $checkbox = New-Object System.Windows.Forms.CheckBox
        $checkbox.Text = $days[$i]
        $checkbox.Font = $font
        # Calculate Y coordinate separately
        $yCoordinate = 30 + ($i * 35)
        $checkbox.Location = New-Object System.Drawing.Point(20, $yCoordinate)

        $checkbox.Size = New-Object System.Drawing.Size(150, 20)
        $checkbox.ForeColor = [System.Drawing.Color]::DarkSlateGray
        $daysGroupBox.Controls.Add($checkbox)
        $controls[$days[$i]] = $checkbox
    }

   
    $timeGroupBox = New-Object System.Windows.Forms.GroupBox
    $timeGroupBox.Text = "Set Time"
    $timeGroupBox.Font = $font
    $timeGroupBox.Size = New-Object System.Drawing.Size(300, 100)
    $timeGroupBox.Location = New-Object System.Drawing.Point(20, 330)
    $timeGroupBox.BackColor = [System.Drawing.Color]::WhiteSmoke
    $form.Controls.Add($timeGroupBox)

   
    $hourLabel = New-Object System.Windows.Forms.Label
    $hourLabel.Text = "Hour:"
    $hourLabel.Font = $font
    $hourLabel.Location = New-Object System.Drawing.Point(20, 30)
    $hourLabel.Size = New-Object System.Drawing.Size(50, 20)
    $hourLabel.ForeColor = [System.Drawing.Color]::DarkSlateGray
    $timeGroupBox.Controls.Add($hourLabel)

    $hourTextBox = New-Object System.Windows.Forms.TextBox
    $hourTextBox.Location = New-Object System.Drawing.Point(80, 30)
    $hourTextBox.Size = New-Object System.Drawing.Size(50, 20)
    $hourTextBox.Font = $font
    $timeGroupBox.Controls.Add($hourTextBox)

  
    $minuteLabel = New-Object System.Windows.Forms.Label
    $minuteLabel.Text = "Minute:"
    $minuteLabel.Font = $font
    $minuteLabel.Location = New-Object System.Drawing.Point(150, 30)
    $minuteLabel.Size = New-Object System.Drawing.Size(60, 20)
    $minuteLabel.ForeColor = [System.Drawing.Color]::DarkSlateGray
    $timeGroupBox.Controls.Add($minuteLabel)

    $minuteTextBox = New-Object System.Windows.Forms.TextBox
    $minuteTextBox.Location = New-Object System.Drawing.Point(220, 30)
    $minuteTextBox.Size = New-Object System.Drawing.Size(50, 20)
    $minuteTextBox.Font = $font
    $timeGroupBox.Controls.Add($minuteTextBox)

    
    $saveButton = New-Object System.Windows.Forms.Button
    $saveButton.Text = "Save Settings"
    $saveButton.Font = $font
    $saveButton.Size = New-Object System.Drawing.Size(120, 35)
    $saveButton.BackColor = [System.Drawing.Color]::DarkSlateGray
    $saveButton.ForeColor = [System.Drawing.Color]::White
    $saveButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $saveButton.FlatAppearance.BorderSize = 0
    $saveButton.Location = New-Object System.Drawing.Point(115, 450)
    $form.Controls.Add($saveButton)

    $skinspath = $RmAPI.VariableStr('Skinspath')
    
    $iniFilePath = "$skinspath\MiniAlarm\@Resources\Vars.nek" 

    # Load file content automatically when form loads
    function Load-FileContent {
        if (Test-Path $iniFilePath) {
            $iniContents = Get-Content $iniFilePath | ForEach-Object {
                if ($_ -match "(.+?)=(.+)") {
                    $key = $matches[1].Trim()
                    $value = $matches[2].Trim()
                    if ($controls.ContainsKey($key)) {
                        $controls[$key].Checked = ($value -eq "1")
                    }
                    elseif ($key -eq "Hour") {
                        $hourTextBox.Text = $value
                    }
                    elseif ($key -eq "Minute") {
                        $minuteTextBox.Text = $value
                    }
                }
            }
        }
        else {
            [System.Windows.Forms.MessageBox]::Show("File not found!")
        }
    }
    $form.Add_Shown({ Load-FileContent })

    # Save button event
    $saveButton.Add_Click({
            $hour = $hourTextBox.Text.TrimStart('0')
            $minute = $minuteTextBox.Text.TrimStart('0')

            if (-not ($hour -match '^\d+$') -or [int]$hour -lt 0 -or [int]$hour -gt 24) {
                [System.Windows.Forms.MessageBox]::Show("Please enter a valid hour (0 to 24).")
                return
            }
            if (-not ($minute -match '^\d+$') -or [int]$minute -lt 0 -or [int]$minute -gt 59) {
                [System.Windows.Forms.MessageBox]::Show("Please enter a valid minute (0 to 59).")
                return
            }

            $fileContent = Get-Content $iniFilePath
            for ($i = 0; $i -lt $fileContent.Count; $i++) {
                foreach ($day in $controls.Keys) {
                    if ($fileContent[$i] -match "^$day=") {
                        $value = if ($controls[$day].Checked) { "1" } else { "0" }
                        $fileContent[$i] = "$day=$value"
                    }
                }
                if ($fileContent[$i] -match "^Hour=") {
                    $fileContent[$i] = "Hour=$($hour)"
                }
                elseif ($fileContent[$i] -match "^Minute=") {
                    $fileContent[$i] = "Minute=$($minute)"
                }
            }
            $fileContent | Set-Content $iniFilePath
            [System.Windows.Forms.MessageBox]::Show("File saved successfully!")
            rmbang "[!RainmeterRefreshApp]"
    
        })

    # Show the form
    $form.ShowDialog()
    

}