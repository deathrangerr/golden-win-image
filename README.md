# golden-win-image

..... Powershell script to create a base windows openstack image ........

Pre-requisites
---------------

1. Create a 100MB drive(should be named 'D') from a windows machine from the server, keep in mind it should have internet access.



2. Below Are the links for the softwares that you need to download and move them to the additional drive you created.

..... Download these packages and keep them in a additional drive .......

https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.190-1/virtio-win-gt-x64.msi
https://www.spice-space.org/download/binaries/spice-guest-tools
https://cloudbase.it/cloudbase-init/#download

4. Download the run.ps1 script from the repository and keep it with the additional drive.

5. Now detach the drive and you can attack it to the image for which you want the base or golden image made.

6. Go inside the drive and run the script by right clicking on the run.ps1 and click on run as powershell.



************************************************************************************************************************************************************************************
