###############################################################################################################
# Script - Populate Fields         Author:Juan Pablo Orphanos                                                 #
# Description: This scripts is meant to be triggered by a User Creation Event (event 4720 in Event Log)       #
# (evento 4720 en el Security Event log)                                                                      #
# The script autopopulates some Active Directory the Company Attribute                                        #
#                                                                                                             #
#                                                                                                             #
###############################################################################################################

param ($username)

$date = Get-Date -Format ddMMyyyy-hhmmsss
$day = Get-Date -Format ddMMyyyy
$logFile = "C:\AutoPopulateCompanyScript\log-$day.log"
$company = 'Contoso'

$aduser = Get-ADUser -properties Description -Identity $username
   try {
   Set-ADUser -Identity $aduser -Company $company
            $changemessage = "$fecha : User $username, modified, attribute Company set in $company"
            Out-File -FilePath $logFile -Append -InputObject $changemessage
       }
   catch {
          $failedMessage = "$fecha : Error, could not set attribute Company as $company for user $username"
          Out-File -FilePath $logFile -Append -InputObject $failedmessage
        }
