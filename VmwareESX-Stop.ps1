##REMEMBER## https://4sysops.com/

## Sharp -> Two it is a Comment
#  Sharp -> One its is Command

## Case 1 -> Script First Running use this => Enable Powershell This PC => Ask Question Answer YES
## Case 2 -> powershell -ExecutionPolicy ByPass -File script.ps1

#Set-ExecutionPolicy RemoteSigned 

## Script First Running use this => Check Enable Powershell 

#get-executionpolicy 

## Script First Running use this => Bellow Command Install ESX CLI need on Internet

#Install-Module -Name VMware.PowerCLI -Confirm:$false -AllowClobber -Force

#Import-Module vmware.powercli

## Script First Running use this => WARNING: Please consider joining the VMware Customer Experience Improvement Program
## ANSWER Yes -> Y Current User , ANSWER ALL -> Y All USer 

#Set-PowerCLIConfiguration -Scope User -ParticipateInCEIP $true

## Have a Error -> Connect-VIServer Error: Invalid server certificate 

#Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

## Connect to ESX Server Via Command Prompt

$Username = Read-Host -Prompt "Please enter your Username:"

$Password = Read-Host -Prompt "Please enter your Password:"

$vcenter = "X.X.X.X"

Connect-VIServer $vcenter -User $Username -Password $Password

## GET ALL VM Machines

Get-VM

## GET ALL VM Machines name not inside R'

Get-VM | Where-object {$_.name -notlike '*R2' } 

## GET ALL VM Machines name not inside R'

Get-VM | Where-object {$_.name -like '*DC*' } 

## STOP 2 DC VM Machine via Delay

Get-VM | Where-object {$_.name 'R2DC01' }  | Stop-VMGuest -Confirm:$false
Wait-VM -Name R2DC01 -Delay 120
Get-VM | Where-object {$_.name 'R2DC01' }  | Stop-VMGuest -Confirm:$false

## STOP ALL VM Machine

# $vcenter | ForEach-Object {Stop-VMHost -VMHost $_ -Server $_ -RunAsync}

## Add Delay Time for VM Machine

#Wait-VM -Name DC -Delay 120
#Wait-VM -Name DC -For Heartbeat

## Start VM Server Bellow Command

#Start-VM –VM vm_ismigir

## Disconnect ESX Server to ALL OF THEM OK

#Disconnect-VIServer $vcenter -Confirm:$false
