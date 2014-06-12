#This script was written by Danny McCaslin with NRADC. You can use this script 
#all you want so long as my name stays on it. 
#Let's do some pre-code that will allow us to use Message Boxes
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") |out-null
#Set the path variable
$path = 'C:\Users\Administrator\AppData\Local\Temp\*'

#We want to log everything, so we will set up a log file path
$LogPath = 'C:\CRTMPLog.log'
#Check to see if the log file exists
if ((test-path -Path $LogPath) -eq $false)
    {
        #If it doesn't already exist, create it
        new-item -Path $LogPath -ItemType file -Value "Log File for the Removal of *.CRTMP Files"
    }

#For our log, we want the date and time
$TodaysDate = get-date 

#Here we will create our Get, which we will use for length and for removal later.
$GetItems = Get-ChildItem -path $path -Include *.CRTMP
#And we will want to know the number of files that are being deleted
$GILength = $GetItems.length
#We also want to know how big the total filesize was. We will use megabytes
$GISize = ($GetItems | Measure-Object -Sum Length).Sum / 1MB
#Now that we have all of our variables in place, lets build
if ($GILength -eq 0)
    {
        #If there are no files, then we will return as such
        [System.Windows.Forms.MessageBox]::Show("There are no *.CRTMP files to delete.", "Completed")
    }
    else {
        #If there are files to delete, remove them, let the user know how many were deleted, and log the info
        $GetItems | Remove-Item -force
        [System.Windows.Forms.MessageBox]::Show("$GILength items were deleted see $LogPath for details.", "Completed")
        Add-Content-path $logPath -Value "`n$TodaysDate, $GILength items, $GISize MB"
    }


