# https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/manage/ad-forest-recovery-invaildate-rid-pool

$Domain = New-Object System.DirectoryServices.DirectoryEntry
$DomainSid = $Domain.objectSid
$RootDSE = New-Object System.DirectoryServices.DirectoryEntry("LDAP://RootDSE")
$RootDSE.UsePropertyCache = $false
$RootDSE.Put("invalidateRidPool", $DomainSid.Value)
$RootDSE.SetInfo()
