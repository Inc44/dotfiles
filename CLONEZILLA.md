Download [clonezilla-live-*-amd64.iso](https://sourceforge.net/projects/clonezilla/files/clonezilla_live_stable)

Copy to Ventoy USB

Select `clonezilla-live-*-amd64.iso`

Press Enter

Select `Boot in normal mode`

Press Enter

Select `Clonezilla live (VGA 800x600)`

Press Enter

Select `us_US.UTF-8 English`

Press Enter

Select `Keep`

Press Enter

Select `Start_Clonezilla`

Press Enter

Select `device-image`

Press Enter

Select `local_dev`

Press Enter

Press Enter

Press Ctrl + C

Select `your_partition`

Press Enter

Select `no-fsck`

Press Enter

Select `clonezilla`

Press Enter

Press Tab

Press Tab

Press Enter

Press Enter

Type `n`

Press Enter

Select `Beginner`

Press Enter
### Backing Up Disk
Select `savedisk`

Press Enter

Type `your_backup`

Press Enter

Select `your_disk`

Press Space

Press Enter

Select `-z9p`

Press Enter

Select `-sfsck`

Press Enter

Select `Yes, check the saved image`

Press Enter

Select `-sgoc`

Press Enter

Select `-plu`

Press Enter

Select `-p poweroff`

Press Enter

Press Enter

Type `y`

Press Enter
### Restoring Disk
Select `restoredisk`

Press Enter

Select `your_backup`

Press Enter

Select `your_disk`

Press Enter

Select `-k0`

Press Enter

Select `Yes, check the image before restoring`

Press Enter

Select `-plu`

Press Enter

Select `-p poweroff`

Press Enter

Press Enter

Type `y`

Press Enter

Type `y`

Press Enter